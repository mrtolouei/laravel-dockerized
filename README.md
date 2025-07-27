# 🚀 Laravel Dockerized Project
A complete Laravel project with Docker configuration for easy development and quick deployment

[![Laravel](https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white)](https://laravel.com)
[![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com)
[![PHP](https://img.shields.io/badge/PHP-8.3-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://php.net)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-316192?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-005C84?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com)
[![Redis](https://img.shields.io/badge/Redis-7.0-DC382D?style=for-the-badge&logo=redis&logoColor=white)](https://redis.io)

## ✨ Project Features
- ✅ Complete Docker and docker-compose configuration
- ✅ PHP 8.3 with all required Laravel extensions
- ✅ Optimized Nginx server for Laravel
- ✅ Database options: PostgreSQL 16 or MySQL 8.0
- ✅ Redis for cache and queues
- ✅ Auto-configured Xdebug for debugging
- ✅ Cron job management with Supercronic
- ✅ Horizon support for queue management
- ✅ Consistent and reproducible development environment

## 🛠 Prerequisites
- [PHP](https://www.php.net/)
- [Composer](https://getcomposer.org/download/)
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Git](https://git-scm.com/downloads)

## 🚀 Project Setup
1. Clone the project:
    ```bash
    git clone git@github.com:mrtolouei/laravel-dockerized.git
    cd laravel-dockerized
    ```
2. Copy env file:
    ```bash
    cp .env.example .env
    ```
3. Build and run containers:
    ```bash
   docker compose up -d --build
   ```
4. Install dependencies (if not done automatically):
   ```bash
   docker exec -it laravel_php composer install --ignore-platform-reqs
    ```
5. Generate application key:
    ```bash
    docker exec -it laravel_php php artisan key:generate
    ```
6. Run migrations:
    ```bash
   docker exec -it laravel_php php artisan migrate
   ```
7. Project is ready!:
   - Open in browser: [http://localhost:8000](http://localhost:8000)

## 🏗 Docker Structure
- **nginx:** Web server with optimized configuration for Laravel
- **php:** PHP 8.3 service with all required extensions
- **postgres:** PostgreSQL 16 database (default)
- **mysql:** MySQL 8.0 database (commented by default)
- **redis:** Redis service for cache and queues

## ⚙ Environment Configuration
### Database Selection
You can choose between PostgreSQL or MySQL by:
1. Uncommenting your preferred database service in `docker-compose.yml`
2. Commenting out the other database service
3. Updating the `.env` file with appropriate DB configuration

Default values in `.env` (PostgreSQL):

```text
# For PostgreSQL use: 
DB_CONNECTION=pgsql
DB_HOST=postgres
DB_PORT=5432
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret

# For MySQL use:
# DB_CONNECTION=mysql
# DB_HOST=mysql
# DB_PORT=3306
# DB_DATABASE=laravel
# DB_USERNAME=laravel
# DB_PASSWORD=secret
```
## 🔄 Switching Between Databases
1. To switch to MySQL:
    - Uncomment the MySQL service in `docker-compose.yml`
    - Comment the PostgreSQL service
    - Update `.env` with MySQL credentials
    - Rebuild containers: `docker-compose up -d --build`
2. To switch back to PostgreSQL:
    - Uncomment the PostgreSQL service
    - Comment the MySQL service
    - Update `.env` with PostgreSQL credentials
    - Rebuild containers: `docker-compose up -d --build`

Note: Make sure to backup your data before switching databases as each uses different volumes.


