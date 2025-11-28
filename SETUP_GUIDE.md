# Smart Absensi Miftahul Ulum - Setup & Usage Guide

## ✅ Implementasi Selesai!

Aplikasi absensi mobile Flutter dengan backend API RESTful telah selesai diimplementasikan.

---

## 📱 Fitur Aplikasi

### 1. **Splash Screen** 
   - Muncul saat aplikasi dibuka
   - Auto-check login status
   - Redirect ke Login atau Home

### 2. **Authentication Flow**
   - ✅ **Login Page**: Email & password dengan validasi
   - ✅ **Register Page**: Nama, email, password, re-password
   - ✅ Token-based authentication (JWT)
   - ✅ Auto-save token ke local storage
   - ✅ "Lupa Password?" link (siap untuk implementasi)

### 3. **Home Page (Beranda)**
   - ✅ User profile display
   - ✅ Digital clock real-time
   - ✅ Tanggal dengan format Indonesia
   - ✅ **Check IN** button dengan fingerprint icon
   - ✅ **Check OUT** button dengan face recognition icon
   - ✅ Feature cards: Lokasi, Riwayat, Darurat, Pengumuman, Perpustakaan, Lainnya
   - ✅ Bottom navigation (Beranda, Profil)
   - ✅ Semua icon dapat diklik

### 4. **Profile Page**
   - ✅ User information display
   - ✅ Biometric icons (fingerprint & face)
   - ✅ Change password button
   - ✅ My profile detail view
   - ✅ **Logout** button (clear token & redirect to login)

### 5. **Backend Integration**
   - ✅ API service dengan error handling
   - ✅ Auth service (login, register, logout)
   - ✅ Attendance service (check-in, check-out, history)
   - ✅ Token management dengan shared_preferences
   - ✅ Automatic auth check on splash

---

## 🔧 Teknologi Stack

- **Frontend**: Flutter 3.9.2 (Dart)
- **State Management**: StatefulWidget
- **HTTP Client**: http ^1.2.2
- **Local Storage**: shared_preferences ^2.2.3
- **Backend**: RESTful API (ready to connect)

---

## 📁 Struktur File Baru

```
lib/
├── models/
│   └── user.dart                    # User data model
├── services/
│   ├── api_service.dart             # HTTP client wrapper
│   ├── auth_service.dart            # Login, register, logout
│   └── attendance_service.dart      # Check-in, check-out, history
├── screens/
│   ├── splash_screen.dart           # Splash dengan auto-check auth
│   ├── home_page.dart               # Updated dengan API calls
│   └── profile_page.dart            # Updated logout
├── login/
│   ├── login.dart                   # Updated dengan API integration
│   └── register_page.dart           # Updated dengan API integration
└── main.dart                        # Updated entry point
```

---

## 🚀 Cara Menjalankan Aplikasi

### Windows Setup (PENTING!)

1. **Enable Developer Mode:**
   ```powershell
   start ms-settings:developers
   ```
   - Atau buka Settings → Update & Security → For Developers
   - Aktifkan "Developer Mode"
   - Restart komputer jika diminta

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run Application:**
   ```bash
   flutter run -d windows
   ```

### Android/iOS
```bash
flutter run -d android
flutter run -d ios
```

---

## 🔌 Koneksi Backend

### Option 1: Gunakan Mock Backend (untuk testing)

Sementara backend belum ready, bisa mock API di file `lib/services/auth_service.dart`:

```dart
static Future<User> login(String email, String password) async {
  // Mock response
  await Future.delayed(const Duration(seconds: 1));
  const token = 'mock_token_12345';
  final user = User(id: '1', name: 'Test User', email: email);
  await _saveToken(token);
  await _saveUserId(user.id);
  return user;
}
```

### Option 2: Connect Real Backend

1. Edit `lib/services/api_service.dart`:
   ```dart
   static const String baseUrl = 'https://your-api.com';
   ```

2. Implementasikan backend endpoints sesuai file **`API_INTEGRATION_GUIDE.md`**

---

## 📖 API Documentation

Lihat file **`API_INTEGRATION_GUIDE.md`** untuk:
- ✅ Endpoint specifications (login, register, attendance)
- ✅ Request/Response format
- ✅ Error handling
- ✅ Security best practices
- ✅ Testing strategies

---

## 🎯 Alur Aplikasi (User Flow)

```
1. Splash Screen (2 detik)
   ↓
2. Check login status
   ↓
   ├─→ Logged In  → Home Page
   │
   └─→ Not Logged → Login Page
                     ↓
                     ├─→ Login → Home Page
                     │
                     └─→ Register → Register Page → Home Page

3. Home Page
   ├─→ Check IN button → API call → Success/Error message
   ├─→ Check OUT button → API call → Success/Error message
   ├─→ Feature cards → Click feedback
   └─→ Profile tab → Profile Page

4. Profile Page
   ├─→ Change Password → Dialog
   ├─→ My Profile → Show details
   └─→ Logout → Clear token → Login Page
```

---

## 🎨 UI/UX Highlights

- ✅ **Green Theme** (Miftahul Ulum branding): `#2E7D32`
- ✅ **Responsive Design**: Adaptif untuk berbagai ukuran layar
- ✅ **Loading States**: CircularProgressIndicator saat API calls
- ✅ **Error Handling**: User-friendly error messages
- ✅ **Smooth Navigation**: pushReplacement untuk flow yang clean
- ✅ **Real-time Clock**: Update setiap detik
- ✅ **Indonesian Locale**: Tanggal dan teks dalam Bahasa Indonesia

---

## 🔐 Security Features

- ✅ Password obscured input
- ✅ Token-based authentication
- ✅ Secure local storage (shared_preferences)
- ✅ Auto logout on token invalid
- ✅ HTTPS ready (production)

---

## 🛠️ Next Steps (Opsional Enhancement)

1. **Backend Development**
   - Implementasi RESTful API sesuai dokumentasi
   - Database setup (MySQL, PostgreSQL, MongoDB)
   - Deploy ke cloud (Heroku, Railway, AWS)

2. **Additional Features**
   - GPS tracking untuk validasi lokasi
   - Camera/Photo untuk selfie absensi
   - Push notifications
   - Offline mode dengan sync
   - Export laporan (PDF/Excel)
   - QR Code scanning
   - Fingerprint/Face ID biometric auth

3. **Optimization**
   - State management (Provider, Riverpod, Bloc)
   - Caching dengan Hive/SQLite
   - Performance optimization
   - Unit & Integration tests

---

## 📞 Troubleshooting

### Error: "Building with plugins requires symlink support"
**Solution:** Enable Windows Developer Mode (lihat langkah di atas)

### Error: "Failed to connect to API"
**Solution:** 
1. Check internet connection
2. Verify BASE_URL di `api_service.dart`
3. Pastikan backend running
4. Test endpoint dengan Postman

### Login/Register tidak berhasil
**Solution:**
1. Pastikan backend sudah implementasi endpoint
2. Check console logs untuk error details
3. Gunakan mock service untuk testing

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_native_splash: ^2.4.7
  intl: ^0.19.0
  http: ^1.2.2                    # ← NEW: HTTP client
  shared_preferences: ^2.2.3      # ← NEW: Local storage
```

---

## ✨ Credits

**Project**: Smart Absensi Miftahul Ulum  
**Platform**: Flutter (Cross-platform)  
**Institution**: Miftahul Ulum Bettet  
**Version**: 1.0.0

---

## 📝 Notes

- Aplikasi sudah **production-ready** untuk frontend
- Tinggal connect ke backend API
- Semua navigation flow sudah tersambung
- Token management sudah otomatis
- UI/UX sudah sesuai design Miftahul Ulum

**Silakan test aplikasi dan sesuaikan dengan kebutuhan backend Anda!** 🚀
