# Jesselicious Server Architecture

## Overview

New PHP/MariaDB server for jesselicious.com — a replacement for the Dart-based self-hosted server. The app remains **offline-first**; the server is optional and provides cloud sync, trainer marketplace, AI coaching, and social features.

## Technology Stack

- **Backend**: PHP 8.2+ (Laravel or plain PHP with PDO)
- **Database**: MariaDB 10.11+ / MySQL 8.0+
- **Hosting**: Shared hosting (jesselicious.com)
- **API**: RESTful JSON API
- **Auth**: JWT tokens with refresh tokens
- **Real-time**: WebSockets (optional, for trainer-trainee messaging)

## Database Schema

### Users & Authentication

```sql
CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(225) NOT NULL,
    display_name VARCHAR(100) NOT NULL,
    role ENUM('trainee', 'trainer') NOT NULL DEFAULT 'trainee',
    ai_gemini_key VARCHAR(500) DEFAULT NULL,
    ai_enabled TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    last_login_at TIMESTAMP NULL,
    email_verified_at TIMESTAMP NULL,
    INDEX idx_email (email),
    INDEX idx_role (role)
);

CREATE TABLE auth_tokens (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    token_hash VARCHAR(225) NOT NULL,
    refresh_token_hash VARCHAR(225) NOT NULL,
    device_name VARCHAR(100) DEFAULT NULL,
    ip_address VARCHAR(45) DEFAULT NULL,
    expires_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_token (token_hash),
    INDEX idx_refresh (refresh_token_hash),
    INDEX idx_user (user_id)
);

CREATE TABLE sessions (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    data LONGTEXT NOT NULL,
    synced_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user (user_id)
);
```

### Trainer Profiles

```sql
CREATE TABLE trainer_profiles (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL UNIQUE,
    bio TEXT DEFAULT NULL,
    specialties TEXT DEFAULT NULL,
    years_experience INT DEFAULT NULL,
    certifications TEXT DEFAULT NULL,
    hourly_rate DECIMAL(10,2) DEFAULT NULL,
    currency CHAR(3) DEFAULT 'USD',
    location VARCHAR(255) DEFAULT NULL,
    website VARCHAR(255) DEFAULT NULL,
    social_links JSON DEFAULT NULL,
    profile_photo VARCHAR(255) DEFAULT NULL,
    is_verified TINYINT(1) DEFAULT 0,
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE trainer_services (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    trainer_id INT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT DEFAULT NULL,
    price DECIMAL(10,2) NOT NULL,
    duration_minutes INT DEFAULT NULL,
    category VARCHAR(100) DEFAULT NULL,
    is_active TINYINT(1) DEFAULT 1,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (trainer_id) REFERENCES trainer_profiles(id) ON DELETE CASCADE,
    INDEX idx_trainer (trainer_id)
);
```

### Ratings & Testimonials

```sql
CREATE TABLE ratings (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    trainer_id INT UNSIGNED NOT NULL,
    trainee_id INT UNSIGNED NOT NULL,
    rating TINYINT UNSIGNED NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (trainer_id) REFERENCES trainer_profiles(id) ON DELETE CASCADE,
    FOREIGN KEY (trainee_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_rating (trainer_id, trainee_id),
    INDEX idx_trainer (trainer_id)
);

CREATE TABLE testimonials (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    trainer_id INT UNSIGNED NOT NULL,
    trainee_id INT UNSIGNED NOT NULL,
    trainee_name VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    rating TINYINT UNSIGNED NOT NULL CHECK (rating BETWEEN 1 AND 5),
    is_featured TINYINT(1) DEFAULT 0,
    is_approved TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (trainer_id) REFERENCES trainer_profiles(id) ON DELETE CASCADE,
    FOREIGN KEY (trainee_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_trainer (trainer_id),
    INDEX idx_approved (is_approved, is_featured)
);
```

### Trainer Blogs

```sql
CREATE TABLE blog_posts (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    trainer_id INT UNSIGNED NOT NULL,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    content LONGTEXT NOT NULL,
    excerpt TEXT DEFAULT NULL,
    cover_image VARCHAR(255) DEFAULT NULL,
    status ENUM('draft', 'published', 'archived') DEFAULT 'draft',
    published_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (trainer_id) REFERENCES trainer_profiles(id) ON DELETE CASCADE,
    INDEX idx_trainer (trainer_id),
    INDEX idx_status (status, published_at)
);
```

### Trainer-Trainee Relationships

```sql
CREATE TABLE trainee_relationships (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    trainer_id INT UNSIGNED NOT NULL,
    trainee_id INT UNSIGNED NOT NULL,
    status ENUM('pending', 'active', 'paused', 'ended') DEFAULT 'pending',
    started_at TIMESTAMP NULL,
    ended_at TIMESTAMP NULL,
    notes TEXT DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (trainer_id) REFERENCES trainer_profiles(id) ON DELETE CASCADE,
    FOREIGN KEY (trainee_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_pair (trainer_id, trainee_id),
    INDEX idx_trainer (trainer_id),
    INDEX idx_trainee (trainee_id),
    INDEX idx_status (status)
);

CREATE TABLE messages (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    relationship_id INT UNSIGNED NOT NULL,
    sender_id INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    is_read TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (relationship_id) REFERENCES trainee_relationships(id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_relationship (relationship_id, created_at),
    INDEX idx_unread (is_read, created_at)
);

CREATE TABLE trainee_updates (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    relationship_id INT UNSIGNED NOT NULL,
    trainer_id INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    workout_data JSON DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (relationship_id) REFERENCES trainee_relationships(id) ON DELETE CASCADE,
    FOREIGN KEY (trainer_id) REFERENCES trainer_profiles(id) ON DELETE CASCADE,
    INDEX idx_relationship (relationship_id, created_at)
);
```

### AI Coaching

```sql
CREATE TABLE ai_coaching_logs (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    prompt TEXT NOT NULL,
    response TEXT NOT NULL,
    tokens_used INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user (user_id, created_at)
);

CREATE TABLE ai_training_plans (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    goal TEXT NOT NULL,
    plan_data JSON NOT NULL,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active TINYINT(1) DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user (user_id)
);
```

### Workout Sync (Optional Cloud Backup)

```sql
CREATE TABLE workout_sync (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    workout_data LONGTEXT NOT NULL,
    synced_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    version INT DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user (user_id, synced_at)
);
```

## API Endpoints

### Authentication
- `POST /api/auth/register` — Register new user
- `POST /api/auth/login` — Login, returns JWT
- `POST /api/auth/refresh` — Refresh token
- `POST /api/auth/logout` — Invalidate token
- `POST /api/auth/forgot-password` — Password reset request
- `POST /api/auth/reset-password` — Password reset
- `GET /api/auth/me` — Current user profile

### Trainee
- `GET /api/trainee/profile` — Get trainee profile
- `PUT /api/trainee/profile` — Update profile
- `POST /api/trainee/sync` — Sync workout data to cloud
- `GET /api/trainee/sync` — Get last synced data
- `POST /api/trainee/ai/generate-plan` — Generate AI training plan
- `GET /api/trainee/ai/plans` — List AI plans
- `POST /api/trainee/ai/chat` — AI coaching chat

### Trainer
- `GET /api/trainer/profile` — Get trainer profile
- `PUT /api/trainer/profile` — Update profile
- `GET /api/trainer/services` — List services
- `POST /api/trainer/services` — Create service
- `PUT /api/trainer/services/:id` — Update service
- `DELETE /api/trainer/services/:id` — Delete service
- `GET /api/trainer/trainees` — List trainees
- `GET /api/trainer/trainees/:id` — Trainee details
- `POST /api/trainer/trainees/:id/update` — Send update to trainee
- `GET /api/trainer/messages/:trainee_id` — Messages with trainee
- `POST /api/trainer/messages/:trainee_id` — Send message

### Marketplace
- `GET /api/marketplace/trainers` — Browse trainers (with filters)
- `GET /api/marketplace/trainers/:slug` — Trainer public profile
- `GET /api/marketplace/trainers/:slug/reviews` — Trainer reviews
- `GET /api/marketplace/trainers/:slug/blog` — Trainer blog posts
- `POST /api/marketplace/ratings` — Rate a trainer
- `POST /api/marketplace/testimonials` — Submit testimonial
- `GET /api/marketplace/blog/:slug` — Single blog post

### Admin
- `POST /api/admin/verify-trainer/:id` — Verify trainer
- `PUT /api/admin/testimonials/:id/approve` — Approve testimonial
- `DELETE /api/admin/testimonials/:id` — Delete testimonial

## Authentication Flow

1. User registers with email/password → receives verification email
2. User logs in → receives JWT access token (15min) + refresh token (30 days)
3. App stores tokens securely (Android Keystore / iOS Keychain)
4. API requests include `Authorization: Bearer <token>`
5. On token expiry, app uses refresh token to get new access token
6. Server remains optional — app works fully offline

## AI Integration

- Users store their own Gemini API key (encrypted at rest)
- AI coaching uses the user's own key — no server-side AI costs
- Server provides the API endpoint; actual AI calls go through Google's API
- Coaching logs stored for history and debugging

## Deployment

- Shared hosting with PHP 8.2+, MariaDB, and SSL
- Environment variables for secrets (DB credentials, mail settings)
- REST API served from `/api/` subdirectory
- Static blog content served from `/blog/` subdirectory
- CORS configured for app domains

## Security

- Passwords hashed with bcrypt
- JWT tokens with short expiry + refresh rotation
- Rate limiting on auth endpoints
- SQL injection prevention via prepared statements
- XSS prevention via output escaping
- CSRF protection for web endpoints
- AI keys encrypted at rest using AES-256

## Migration from Dart Server

- Existing Dart server data can be imported via CSV/JSON
- New server does not need to be backward-compatible with Dart server
- Users migrate by creating new accounts and importing their data
