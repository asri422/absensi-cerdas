# Smart Absensi Miftahul Ulum Bettet

Aplikasi presensi pintar untuk siswa Miftahul Ulum Bettet yang dibuat dengan Flutter.

## 🎯 Fitur Utama

### 1. **Halaman Beranda (Home Screen)**
- **Header dengan Informasi Waktu Real-time**
  - Jam digital yang update setiap detik
  - Tampilan tanggal dalam bahasa Indonesia
  - Latar belakang hijau dengan nama sekolah "MIFTAHUL ULUM BETTET"
  
- **Profil Siswa**
  - Avatar siswa
  - Nama lengkap: Asri Barokatul Jannah
  - NIS: 2024001
  - Institusi

- **Panel Jadwal**
  - Hari dan tanggal aktual
  - Indikator waktu (08:30, 09:00, 12:30, 14:00)
  - Kode warna untuk status waktu

- **Menu Aksi Utama**
  - Tombol **IN** (Check In) dengan ikon sidik jari
  - Tombol **OUT** (Check Out) dengan ikon wajah
  - Grid fitur: Lokasi, Riwayat, Darurat, Pengumuman, Perpustakaan, Lainnya

- **Bottom Navigation**
  - Tab Beranda
  - Tab Profil
  - FAB dengan huruf "M" di tengah

### 2. **Halaman Profil**
- Informasi pribadi lengkap
- Data kontak (email, telepon, alamat)
- Informasi sekolah dan kelas
- Tombol Edit Profil
- Tombol Keluar

### 3. **Halaman Login** (Existing)
- Form login dengan email dan password
- Navigasi ke halaman registrasi
- Link lupa password

## 🚀 Cara Menjalankan

### Prasyarat
- Flutter SDK sudah terinstall
- Chrome browser atau emulator Android/iOS

### Langkah-langkah

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Jalankan aplikasi:**
   
   **Untuk Web (Chrome):**
   ```bash
   flutter run -d chrome
   ```
   
   **Untuk Windows (perlu Visual Studio):**
   ```bash
   flutter run -d windows
   ```
   
   **Untuk Android:**
   ```bash
   flutter run -d <device_id>
   ```

3. **Build untuk production:**
   ```bash
   # Web
   flutter build web
   
   # Windows
   flutter build windows
   
   # Android
   flutter build apk
   ```

## 📁 Struktur Proyek

```
lib/
├── main.dart                    # Entry point aplikasi
├── login/
│   ├── login.dart              # Halaman login
│   ├── register_page.dart      # Halaman registrasi
│   └── forgot_password_page.dart # Halaman lupa password
└── screens/
    ├── home_page.dart          # Halaman beranda utama
    └── profile_page.dart       # Halaman profil siswa
```

## 🎨 Tema Warna

- **Primary Color:** `#2E7D32` (Hijau gelap)
- **Secondary Color:** `#1B5E20` (Hijau sangat gelap)
- **Accent Color:** `#FFA726` (Orange)
- **Action Colors:**
  - Check In: `#4CAF50` (Hijau)
  - Check Out: `#2196F3` (Biru)

## 📸 Menambahkan Gambar

Untuk menambahkan gambar latar belakang dan avatar:

1. Buat gambar yang diperlukan:
   - `assets/school_background.jpg` - Foto sekolah (800x400px)
   - `assets/avatar_default.png` - Avatar default (200x200px)

2. Uncomment baris di `pubspec.yaml`:
   ```yaml
   assets:
     - assets/absensi_png.png
     - assets/school_background.jpg
     - assets/avatar_default.png
   ```

3. Update method `_buildBackgroundImage()` di `home_page.dart`:
   ```dart
   DecorationImage? _buildBackgroundImage() {
     return const DecorationImage(
       image: AssetImage('assets/school_background.jpg'),
       fit: BoxFit.cover,
       opacity: 0.3,
     );
   }
   ```

4. Jalankan `flutter pub get` untuk refresh assets

## ✨ Fitur yang Dapat Dikembangkan

1. **Integrasi Backend**
   - API untuk login/registrasi
   - Penyimpanan data presensi ke database
   - Sinkronisasi data siswa

2. **Fitur Presensi**
   - Integrasi dengan fingerprint/face recognition
   - GPS location tracking
   - Foto saat check in/out

3. **Fitur Tambahan**
   - Notifikasi push untuk pengumuman
   - Riwayat absensi lengkap
   - Grafik statistik kehadiran
   - Download laporan PDF

4. **Keamanan**
   - JWT authentication
   - Enkripsi data sensitif
   - Biometric authentication

## 🔧 Konfigurasi

### Mengubah Data Siswa Default

Edit file `lib/screens/home_page.dart` dan `lib/screens/profile_page.dart` untuk mengubah data siswa default.

### Mengubah Jadwal Waktu

Edit bagian time indicators di `home_page.dart`:
```dart
_buildTimeIndicator('08:30', Colors.grey[700]!),
_buildTimeIndicator('09:00', Colors.grey[700]!),
_buildTimeIndicator('12:30', Colors.red[300]!),
_buildTimeIndicator('14:00', Colors.red[300]!),
```

## 📱 Platform Support

- ✅ Web (Chrome, Edge)
- ✅ Android
- ✅ iOS
- ✅ Windows (memerlukan Visual Studio)
- ✅ macOS
- ✅ Linux

## 📝 Catatan

- Aplikasi saat ini langsung membuka halaman beranda untuk demo
- Untuk mengaktifkan login screen, ubah di `main.dart`:
  ```dart
  home: const LoginPage(), // Uncomment ini
  // home: const HomePage(), // Comment ini
  ```

## 🐛 Troubleshooting

### Error: Visual Studio toolchain not found
Jika menjalankan di Windows, gunakan web platform:
```bash
flutter run -d chrome
```

### Asset not found error
Pastikan file gambar ada di folder `assets/` dan uncomment di `pubspec.yaml`

## 👨‍💻 Developer

Aplikasi ini dibuat untuk Miftahul Ulum Bettet menggunakan Flutter framework.

---

**Selamat Menggunakan Aplikasi Smart Absensi!** 🎓
