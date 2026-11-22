import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jesselicious/app/jesselicious_app.dart';
import 'package:jesselicious/l10n/l10n.dart';
import 'package:jesselicious/services/local_store.dart';
import 'package:jesselicious/state/fit_state.dart';
import 'package:jesselicious/widgets/file_thumb.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Store.instance.init();
    fit.resetAllData();
    fit.onboarded = true;
    setAppLanguage('en');
  });

  testWidgets('fotos: con muchas fotos solo se construyen las que se ven', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(tester.view.reset);
    final now = DateTime.now();
    for (var i = 0; i < 120; i++) {
      fit.moments.add(Moment(now.subtract(Duration(days: i)), 'missing-$i.jpg'));
    }
    fit.goMoments();
    await tester.pumpWidget(const JesseliciousApp());
    await tester.pumpAndSettle();

    final built = find.byType(FileThumb).evaluate().length;
    expect(built, greaterThan(0));
    expect(built, lessThan(60));
    fit.moments.clear();
    fit.persistNow();
  });
}
