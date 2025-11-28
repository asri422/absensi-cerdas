# Architecture Overview - Smart Absensi

## Application Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                         APP START                                │
│                         main.dart                                │
└─────────────────────────┬───────────────────────────────────────┘
                          │
                          ▼
                  ┌───────────────┐
                  │ SplashScreen  │ (2 seconds)
                  │ - Show logo   │
                  │ - Check auth  │
                  └───────┬───────┘
                          │
           ┌──────────────┴──────────────┐
           │                             │
    [Has Token?]                  [No Token?]
           │                             │
           ▼                             ▼
    ┌─────────────┐              ┌─────────────┐
    │  HomePage   │              │  LoginPage  │
    │  (Beranda)  │              └──────┬──────┘
    └─────┬───────┘                     │
          │                       ┌─────┴──────┐
          │                       │            │
          │                    [Login]    [Register]
          │                       │            │
          │                       │      ┌─────────────┐
          │                       │      │RegisterPage │
          │                       │      └──────┬──────┘
          │                       │             │
          │                       └─────────┬───┘
          │                                 │
          │                          [Success]
          │                                 │
          └─────────────────────────────────┘
                          │
                          ▼
          ┌───────────────────────────┐
          │       HomePage            │
          │  ┌─────────────────────┐  │
          │  │ - User Info         │  │
          │  │ - Digital Clock     │  │
          │  │ - Check IN button   │  │
          │  │ - Check OUT button  │  │
          │  │ - Feature Cards     │  │
          │  └─────────────────────┘  │
          └─────┬─────────────────────┘
                │
      ┌─────────┴──────────┐
      │                    │
  [IN/OUT]          [Profile Tab]
      │                    │
      ▼                    ▼
┌─────────────┐    ┌──────────────┐
│ Attendance  │    │ ProfilePage  │
│ API Call    │    │ - User info  │
└─────────────┘    │ - Change pwd │
                   │ - Logout     │
                   └──────┬───────┘
                          │
                      [Logout]
                          │
                          ▼
                   ┌─────────────┐
                   │ Clear Token │
                   │ → LoginPage │
                   └─────────────┘
```

---

## Service Layer Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                      UI Layer (Screens)                      │
│  SplashScreen │ LoginPage │ RegisterPage │ HomePage │ ProfilePage  │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│                   Service Layer                              │
│                                                              │
│  ┌──────────────┐  ┌──────────────┐  ┌─────────────────┐   │
│  │ AuthService  │  │ Attendance   │  │   ApiService    │   │
│  │              │  │   Service    │  │                 │   │
│  │ - login()    │  │ - checkIn()  │  │ - get()         │   │
│  │ - register() │  │ - checkOut() │  │ - post()        │   │
│  │ - logout()   │  │ - getHistory │  │ - error handler │   │
│  │ - getToken() │  │              │  │                 │   │
│  └──────┬───────┘  └──────┬───────┘  └────────┬────────┘   │
│         │                 │                    │            │
└─────────┼─────────────────┼────────────────────┼────────────┘
          │                 │                    │
          └─────────────────┴────────────────────┘
                            │
                            ▼
          ┌──────────────────────────────────┐
          │    External Dependencies         │
          │                                  │
          │  ┌────────────────────────────┐  │
          │  │  shared_preferences        │  │
          │  │  (Token Storage)           │  │
          │  └────────────────────────────┘  │
          │                                  │
          │  ┌────────────────────────────┐  │
          │  │  http package              │  │
          │  │  (API Calls)               │  │
          │  └────────────────────────────┘  │
          └──────────────┬───────────────────┘
                         │
                         ▼
          ┌──────────────────────────────────┐
          │   Backend REST API               │
          │   (Your Server)                  │
          └──────────────────────────────────┘
```

---

## Data Flow Example: Login Process

```
1. User enters email & password
                │
                ▼
2. LoginPage._handleLogin()
                │
                ▼
3. AuthService.login(email, password)
                │
                ▼
4. ApiService.post('/auth/login', {email, password})
                │
                ▼
5. HTTP Request → Backend Server
                │
    ┌───────────┴───────────┐
    │                       │
  [Success]              [Error]
    │                       │
    ▼                       ▼
6. Response:           6. Throw Exception
   {token, user}              │
    │                         ▼
    ▼                   Show Error Message
7. Save token to
   SharedPreferences
    │
    ▼
8. Return User object
    │
    ▼
9. Navigate to HomePage
```

---

## Token Management Flow

```
┌─────────────┐
│  App Start  │
└──────┬──────┘
       │
       ▼
┌────────────────────┐
│ SplashScreen       │
│ AuthService.       │
│ isLoggedIn()       │
└──────┬─────────────┘
       │
       ▼
┌────────────────────┐
│ SharedPreferences  │
│ .getString('token')│
└──────┬─────────────┘
       │
   ┌───┴────┐
   │        │
[Token]  [No Token]
   │        │
   ▼        ▼
HomePage  LoginPage
   │
   │ (User uses app)
   │
   ▼
┌────────────────────┐
│ API Calls include  │
│ Authorization:     │
│ Bearer {token}     │
└────────────────────┘
   │
   ▼
┌────────────────────┐
│ Backend validates  │
│ token              │
└──────┬─────────────┘
       │
   ┌───┴────┐
   │        │
[Valid]  [Invalid]
   │        │
   ▼        ▼
Success   401 Error
           │
           ▼
     Auto Logout
     Clear Token
           │
           ▼
      LoginPage
```

---

## File Dependencies Map

```
main.dart
  └─> splash_screen.dart
       ├─> auth_service.dart
       │    ├─> api_service.dart
       │    ├─> user.dart
       │    └─> shared_preferences
       ├─> login.dart
       │    ├─> auth_service.dart
       │    ├─> register_page.dart
       │    └─> home_page.dart
       └─> home_page.dart
            ├─> attendance_service.dart
            │    ├─> api_service.dart
            │    └─> auth_service.dart
            └─> profile_page.dart
                 ├─> auth_service.dart
                 └─> login.dart
```

---

## State Management

Current: **StatefulWidget** (Simple & Effective)

### Key State Variables:

**LoginPage:**
- `_emailController: TextEditingController`
- `_passwordController: TextEditingController`
- `_isLoading: bool`

**RegisterPage:**
- `_nameController: TextEditingController`
- `_emailController: TextEditingController`
- `_passwordController: TextEditingController`
- `_rePasswordController: TextEditingController`
- `_isLoading: bool`

**HomePage:**
- `_selectedIndex: int`
- `_timer: Timer`
- `_currentTime: DateTime`

**ProfilePage:**
- `_selectedIndex: int`

---

## API Call Pattern

```dart
// 1. Get token (if needed)
final token = await AuthService.getToken();

// 2. Make API call
try {
  final response = await ApiService.post(
    '/endpoint',
    {'key': 'value'},
    token: token,
  );
  
  // 3. Handle success
  // Update UI, show message, navigate
  
} catch (e) {
  // 4. Handle error
  if (e is ApiException) {
    if (e.statusCode == 401) {
      // Token invalid → logout
      await AuthService.logout();
      // Navigate to login
    } else {
      // Show error message
    }
  }
}
```

---

## Navigation Pattern

### pushReplacement (No back button):
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => HomePage()),
);
```
Used for:
- Splash → Login/Home
- Login → Home
- Register → Home
- Logout → Login

### push (Can go back):
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProfilePage()),
);
```
Used for:
- Home → Profile
- Login → Register (with back)

### pushAndRemoveUntil (Clear stack):
```dart
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (context) => LoginPage()),
  (route) => false,
);
```
Used for:
- Logout (clear all navigation history)

---

## Error Handling Strategy

1. **API Level** (api_service.dart):
   - HTTP errors → ApiException
   - Status codes 200-299 → Success
   - Other codes → Throw with message

2. **Service Level** (auth_service.dart, attendance_service.dart):
   - Try-catch around API calls
   - Re-throw with context

3. **UI Level** (screens):
   - Try-catch around service calls
   - Show SnackBar with error message
   - Set loading state to false

---

## Security Considerations

1. **Token Storage**: 
   - SharedPreferences (encrypted on device)
   - Never log tokens to console in production

2. **Password Handling**:
   - Always use obscureText: true
   - Never store plain passwords
   - Backend must hash passwords

3. **HTTPS**:
   - Production must use HTTPS
   - No sensitive data over HTTP

4. **Token Validation**:
   - Backend validates every request
   - Frontend handles 401 → auto logout

---

## Performance Optimizations

1. **Lazy Loading**: Services created on demand
2. **Dispose Controllers**: All TextEditingControllers disposed
3. **Timer Management**: Clock timer canceled on dispose
4. **Async Operations**: Proper async/await pattern
5. **Loading States**: Prevent duplicate requests

---

This architecture ensures:
- ✅ Clean separation of concerns
- ✅ Easy to test each layer
- ✅ Scalable for future features
- ✅ Maintainable codebase
- ✅ User-friendly error handling
