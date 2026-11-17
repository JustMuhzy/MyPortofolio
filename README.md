# Portfolio Muhzy — React + Node.js

Migrasi dari PHP ke React (Vite) + Node.js/Express + MySQL. Tema dark technology dan Tech Grid & Circuit dipertahankan.

## Persiapan
- Node.js 20 LTS atau lebih baru
- MySQL (bisa tetap memakai MySQL dari XAMPP; Apache tidak diperlukan)

## Instalasi database
1. Jalankan MySQL dari XAMPP.
2. Buka phpMyAdmin.
3. Untuk instalasi baru, import `server/database.sql`.
4. Jika database `portfolio_muhzy` lama sudah ada, JANGAN import ulang file database.sql. Backup database terlebih dahulu, lalu pastikan tabel `hobbies`, `page_views`, `visitor_messages` dan kolom pesan anonim tersedia. File `server/database_migration_existing.sql` membantu menambahkan tabel/kolom yang belum ada.

## Menjalankan aplikasi
Terminal 1:
```bash
cd server
copy .env.example .env
npm install
npm run dev
```
Edit `.env` sesuai MySQL lokal. Terminal 2:
```bash
cd client
npm install
npm run dev
```
Buka alamat Vite yang ditampilkan (biasanya http://localhost:5173).

## Login admin awal
Username: `admin`  
Password: `MuhzyAdmin2026!`
Segera ganti password setelah login. Password awal mengikuti hash bcrypt dari aplikasi PHP lama.

## Struktur
- `client`: React frontend, halaman publik dan dashboard admin.
- `server`: Express API, autentikasi session, upload, analitik dan koneksi MySQL.
- `server/uploads`: file profil, proyek, galeri, dan CV.

## Catatan migrasi
- Data MySQL lama dipertahankan; aplikasi baru memakai skema tabel yang sama.
- Salin file yang sebelumnya ada di `uploads/profile`, `uploads/projects`, `uploads/gallery`, dan `uploads/cv` ke folder `server/uploads` masing-masing bila ingin foto/CV lama tetap tampil.
- React tidak menggantikan backend. React menangani tampilan; Express menangani API, autentikasi, upload dan database.
- Untuk produksi, gunakan HTTPS, ubah SESSION_SECRET, password admin, dan konfigurasi cookie sesuai domain.
