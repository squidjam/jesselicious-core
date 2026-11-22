import 'dart:convert';
import 'dart:io';

import 'package:jesselicious_server/jesselicious_server.dart';

Future<void> main(List<String> args) async {
  if (args.contains('--help') || args.contains('-h')) {
    stdout.writeln('''Jesselicious server $serverVersion

Environment:
  JESSELICIOUS_PORT       port to listen on (default 8080)
  JESSELICIOUS_HOST       address to bind (default 0.0.0.0)
  JESSELICIOUS_DATA       folder for your data (default ./data next to the server)
  JESSELICIOUS_WEB        folder with the web app (default ./web next to the server)
  JESSELICIOUS_PASSWORD   ask for this password in the browser (optional)
  JESSELICIOUS_PEOPLE     several people, each with their own data: "Ana, Pablo" or "Ana:pass1, Pablo:pass2"
  JESSELICIOUS_SYNC       folder shared with your phone through Syncthing (default DATA/sync, "off" to disable)
  JESSELICIOUS_KEEP_DAYS  daily copies of your data to keep (default 30)

  --health           exit 0 if the server answers, 1 if not''');
    return;
  }
  if (args.contains('--health')) {
    exit(await _healthy(Config.fromEnvironment()) ? 0 : 1);
  }
  final Config config;
  try {
    config = Config.fromEnvironment();
  } on FormatException catch (e) {
    stderr.writeln('JESSELICIOUS_PEOPLE: ${e.message}');
    exit(1);
  }
  final server = JesseliciousServer(config);
  try {
    await server.start();
  } on FormatException catch (e) {
    stderr.writeln('JESSELICIOUS_PEOPLE: ${e.message}');
    exit(1);
  } on FileSystemException catch (e) {
    stderr.writeln('Jesselicious cannot write to ${e.path ?? config.dataDir}.');
    if (File('/.dockerenv').existsSync() || config.dataDir == '/data') {
      stderr.writeln('The folder you mounted on /data belongs to another user. Either:');
      stderr.writeln('  - give it to the user Jesselicious runs as: chown -R 1000:1000 <that folder>');
      stderr.writeln('  - or run Jesselicious as the folder owner: --user <uid>:<gid> (in compose, user: "<uid>:<gid>")');
      stderr.writeln('  - or use a Docker volume instead of a folder: -v jesselicious-data:/data');
    } else {
      stderr.writeln('Give the user that runs Jesselicious write access to that folder, or set JESSELICIOUS_DATA to another one.');
    }
    exit(1);
  } on SocketException catch (e) {
    stderr.writeln('Jesselicious cannot listen on port ${config.port}: ${e.osError?.message ?? e.message}');
    stderr.writeln('Another program may be using it. Set JESSELICIOUS_PORT to another port.');
    exit(1);
  }
  stdout.writeln('Jesselicious $serverVersion is running.');
  stdout.writeln('  Open:  http://localhost:${server.port}');
  for (final ip in await _lanAddresses()) {
    stdout.writeln('         http://$ip:${server.port}');
  }
  if (server.shared) {
    for (final s in server.spaces) {
      stdout.writeln('  ${s.person!.display}:');
      stdout.writeln('    Open:  http://localhost:${server.port}${s.base}');
      stdout.writeln('    Data:  ${Directory(s.dataDir).absolute.path}');
      if (s.syncDir != null) stdout.writeln('    Phone: ${Directory(s.syncDir!).absolute.path}');
      stdout.writeln(s.password != null ? '    Password required.' : '    No password.');
    }
  } else {
    stdout.writeln('  Data:  ${Directory(config.dataDir).absolute.path}');
    if (config.syncDir != null) stdout.writeln('  Phone: ${Directory(config.syncDir!).absolute.path}');
    if (config.password != null) stdout.writeln('  Password required.');
  }

  for (final signal in [ProcessSignal.sigint, if (!Platform.isWindows) ProcessSignal.sigterm]) {
    signal.watch().listen((_) async {
      await server.stop();
      exit(0);
    });
  }
}

Future<List<String>> _lanAddresses() async {
  try {
    final list = await NetworkInterface.list(type: InternetAddressType.IPv4);
    return [
      for (final i in list)
        for (final a in i.addresses)
          if (!a.isLoopback && !a.isLinkLocal) a.address,
    ];
  } catch (_) {
    return const [];
  }
}

Future<bool> _healthy(Config config) async {
  final client = HttpClient()..connectionTimeout = const Duration(seconds: 3);
  try {
    final req = await client.getUrl(Uri.parse('http://127.0.0.1:${config.port}/api/health'));
    final password = config.password;
    if (password != null) {
      req.headers.set(HttpHeaders.authorizationHeader, 'Basic ${base64.encode(utf8.encode('jesselicious:$password'))}');
    }
    final res = await req.close();
    await res.drain<void>();
    return res.statusCode == 200;
  } catch (_) {
    return false;
  } finally {
    client.close(force: true);
  }
}
