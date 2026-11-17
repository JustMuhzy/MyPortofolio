CREATE DATABASE IF NOT EXISTS portfolio_muhzy
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE portfolio_muhzy;

CREATE TABLE IF NOT EXISTS admins (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS site_settings (
  setting_key VARCHAR(80) PRIMARY KEY,
  setting_value TEXT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS skills (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(180) NOT NULL DEFAULT '',
  sort_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS projects (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(180) NOT NULL,
  category VARCHAR(100) NOT NULL DEFAULT '',
  description TEXT NOT NULL,
  status VARCHAR(80) NOT NULL DEFAULT '',
  tech_stack VARCHAR(500) NOT NULL DEFAULT '',
  image VARCHAR(255) NULL,
  project_url VARCHAR(500) NULL,
  sort_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS gallery (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  image VARCHAR(255) NOT NULL,
  caption VARCHAR(180) NOT NULL DEFAULT '',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Login awal: admin / MuhzyAdmin2026!
-- Segera ganti password melalui phpMyAdmin atau fitur pengelolaan admin.
INSERT IGNORE INTO admins (username, password_hash) VALUES
('admin', '$2y$12$mJaz9mI2jrYlD0Gqo0Zi9O6HxNmku761/bxhgp4sYcxaPPi0jgLoC');

INSERT IGNORE INTO site_settings (setting_key, setting_value) VALUES
('full_name', 'Muhammad Zaky'),
('brand_name', 'Muhzy'),
('headline', 'Membangun ide menjadi sesuatu yang berarti.'),
('intro', 'Saya tertarik pada dunia teknologi, pengembangan web, pengolahan data, dan kewirausahaan digital.'),
('about_text', 'Saya adalah pribadi yang memiliki ketertarikan pada teknologi informasi dan pengembangan solusi digital. Saya terus mempelajari bagaimana sebuah ide dapat diwujudkan melalui kode, desain, dan pemanfaatan data.'),
('about_extra', 'Di luar bidang teknologi, saya juga mengembangkan pengalaman kewirausahaan melalui MW Scent Fragrances, sebuah proyek bisnis parfum yang menjadi ruang belajar tentang branding, pemasaran, dan e-commerce.'),
('email', 'emailkamu@example.com'),
('location', 'Indonesia'),
('profile_image', ''),
('cv_file', '');

INSERT IGNORE INTO skills (id, name, description, sort_order) VALUES
(1, 'HTML & CSS', 'Web structure and styling', 1),
(2, 'JavaScript', 'Interactive web interfaces', 2),
(3, 'PHP', 'Backend fundamentals', 3),
(4, 'MySQL', 'Database design and queries', 4),
(5, 'Python', 'Data processing and ML practice', 5),
(6, 'Java', 'Object-oriented programming', 6);

INSERT IGNORE INTO projects (id, title, category, description, status, tech_stack, sort_order) VALUES
(1, 'LinTechnology — Multi-Vendor Marketplace', 'Web Development', 'Konsep aplikasi marketplace mini dengan autentikasi, katalog produk, pencarian, keranjang, detail produk, dan pengelolaan produk admin.', 'Project concept', 'PHP,MySQL,HTML,CSS,JavaScript', 1),
(2, 'MW Scent Fragrances', 'Entrepreneurship & Digital Commerce', 'Pengembangan toko parfum dan decant, mulai dari identitas merek, katalog produk, konten promosi, hingga strategi penjualan marketplace.', 'Business project', 'Branding,E-commerce,Content,Marketing', 2),
(3, 'Machine Learning Practice', 'Data & Machine Learning', 'Eksplorasi pengolahan data dan algoritma machine learning, termasuk clustering dengan K-Means, Elbow Method, dan Silhouette Score.', 'Learning project', 'Python,Pandas,Scikit-learn,Google Colab', 3);


CREATE TABLE IF NOT EXISTS hobbies (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(180) NOT NULL DEFAULT '',
  sort_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS page_views (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  visitor_hash CHAR(64) NOT NULL,
  page_path VARCHAR(190) NOT NULL DEFAULT '/',
  device_type ENUM('Mobile','Desktop','Tablet','Other') NOT NULL DEFAULT 'Other',
  visited_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_visited_at (visited_at),
  INDEX idx_visitor_date (visitor_hash, visited_at)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS visitor_messages (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NULL DEFAULT NULL,
  email VARCHAR(190) NULL DEFAULT NULL,
  subject VARCHAR(180) NULL DEFAULT NULL,
  message TEXT NOT NULL,
  is_read TINYINT(1) NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_message_read (is_read, created_at)
) ENGINE=InnoDB;

INSERT IGNORE INTO site_settings (setting_key, setting_value) VALUES
('whatsapp', ''),
('instagram', ''),
('tiktok', ''),
('facebook', '');
