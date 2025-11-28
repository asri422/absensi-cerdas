# API Integration Guide - Smart Absensi Miftahul Ulum

## Overview
Aplikasi ini telah diintegrasikan dengan backend RESTful API. File ini menjelaskan endpoint yang harus Anda implementasikan di backend.

## Base URL Configuration
Edit file `lib/services/api_service.dart` dan ubah:
```dart
static const String baseUrl = 'https://api.example.com'; // TODO: set your backend URL
```
Ganti dengan URL backend Anda, misalnya: `https://api.miftahululum.com` atau `http://localhost:3000`

---

## Authentication Endpoints

### 1. Login
**POST** `/auth/login`

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

**Success Response (200 OK):**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "123",
    "name": "Asri Barokatul Jannah",
    "email": "asri@example.com"
  }
}
```

**Error Response (401 Unauthorized):**
```json
{
  "message": "Email atau password salah"
}
```

---

### 2. Register
**POST** `/auth/register`

**Request Body:**
```json
{
  "name": "Asri Barokatul Jannah",
  "email": "asri@example.com",
  "password": "password123"
}
```

**Success Response (201 Created):**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "123",
    "name": "Asri Barokatul Jannah",
    "email": "asri@example.com"
  }
}
```

**Error Response (400 Bad Request):**
```json
{
  "message": "Email sudah terdaftar"
}
```

---

## Attendance Endpoints

### 3. Check In
**POST** `/attendance/check-in`

**Headers:**
```
Authorization: Bearer {token}
Content-Type: application/json
```

**Request Body:**
```json
{
  "timestamp": "2024-11-27T10:30:00.000Z",
  "type": "in"
}
```

**Success Response (200 OK):**
```json
{
  "message": "Check in berhasil",
  "record": {
    "id": "456",
    "userId": "123",
    "timestamp": "2024-11-27T10:30:00.000Z",
    "type": "in"
  }
}
```

---

### 4. Check Out
**POST** `/attendance/check-out`

**Headers:**
```
Authorization: Bearer {token}
Content-Type: application/json
```

**Request Body:**
```json
{
  "timestamp": "2024-11-27T16:30:00.000Z",
  "type": "out"
}
```

**Success Response (200 OK):**
```json
{
  "message": "Check out berhasil",
  "record": {
    "id": "457",
    "userId": "123",
    "timestamp": "2024-11-27T16:30:00.000Z",
    "type": "out"
  }
}
```

---

### 5. Get Attendance History
**GET** `/attendance/history`

**Headers:**
```
Authorization: Bearer {token}
```

**Success Response (200 OK):**
```json
{
  "records": [
    {
      "id": "456",
      "userId": "123",
      "timestamp": "2024-11-27T10:30:00.000Z",
      "type": "in"
    },
    {
      "id": "457",
      "userId": "123",
      "timestamp": "2024-11-27T16:30:00.000Z",
      "type": "out"
    }
  ]
}
```

---

## Error Handling
Semua endpoint dapat mengembalikan error berikut:

**401 Unauthorized:**
```json
{
  "message": "Token tidak valid atau telah kadaluarsa"
}
```

**500 Internal Server Error:**
```json
{
  "message": "Terjadi kesalahan server"
}
```

---

## Testing Without Backend

Untuk testing tanpa backend, Anda bisa:

1. **Mock API menggunakan tools seperti:**
   - [Mockoon](https://mockoon.com/)
   - [JSON Server](https://github.com/typicode/json-server)
   - [Postman Mock Server](https://www.postman.com/features/mock-api/)

2. **Atau, buat mock service sementara:**
   Edit `lib/services/auth_service.dart` dan comment API calls, return dummy data:
   ```dart
   static Future<User> login(String email, String password) async {
     // Mock response - comment out untuk production
     await Future.delayed(const Duration(seconds: 1)); // simulate network delay
     const token = 'mock_token_12345';
     final user = User(id: '1', name: 'Test User', email: email);
     await _saveToken(token);
     await _saveUserId(user.id);
     return user;
     
     // Uncomment untuk real API:
     // final data = await ApiService.post('/auth/login', {...});
   }
   ```

---

## Next Steps

1. **Setup Backend:**
   - Buat backend dengan Node.js/Express, Laravel, Django, atau framework lainnya
   - Implementasikan endpoint sesuai dokumentasi di atas
   - Deploy ke server (Heroku, Railway, DigitalOcean, dll)

2. **Update Base URL:**
   - Edit `lib/services/api_service.dart`
   - Masukkan URL backend Anda

3. **Test Integration:**
   - Run `flutter run -d windows`
   - Test login, register, dan attendance features

4. **Additional Features to Add:**
   - Password reset functionality
   - User profile update
   - Lokasi tracking (GPS) untuk absensi
   - Push notifications
   - Foto selfie saat absensi
   - Laporan absensi (export PDF/Excel)

---

## Security Notes

1. **HTTPS:** Selalu gunakan HTTPS di production
2. **Token Expiry:** Implement token refresh mechanism
3. **Validation:** Validate semua input di backend
4. **Rate Limiting:** Batasi request untuk mencegah abuse
5. **Password:** Hash password dengan bcrypt/argon2

---

## Support

Jika Anda membutuhkan backend reference implementation, saya bisa membantu membuat contoh backend menggunakan:
- Node.js + Express + MongoDB
- Laravel + MySQL
- Python + FastAPI + PostgreSQL

Atau framework lain sesuai kebutuhan Anda.
