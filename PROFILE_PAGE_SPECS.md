# Profile Page - Smart Absensi Miftahul Ulum Bettet

## Updated Design Specifications

The profile page has been completely redesigned according to the new specifications provided.

## Components Overview

### 1. Header and Main Information

#### Device Info Label
- Location: Top of screen
- Text: **"iPhone 16 - 9"**
- Style: Small grey text (12px)
- Purpose: Display device/system information

#### Green Bar
- Location: Below device info
- Height: 8px
- Color: `#2E7D32` (Primary green)
- Purpose: Visual separator/brand element

#### Profile Card
- Background: Light grey (`Colors.grey[300]`)
- Border radius: 12px
- Padding: 20px
- Contains:
  - **Avatar Circle**
    - Size: 80x80px
    - Border: 2px black
    - Icon: Person icon (placeholder)
    - Background: White
  
  - **User Details**
    - Name: **"Asri Barokatul Jannah"**
    - ID Number: **"2016.02.111.001"**
    - Institution: **"MIFTAHUL ULUM BETTET"**

### 2. Biometric Authentication Options

- Location: Below profile card
- Background: White
- Border: Grey (`Colors.grey[400]`)
- Border radius: 8px
- Contains two options:
  
  **Fingerprint Icon**
  - Icon: `Icons.fingerprint`
  - Size: 50px
  - Label: "Sidik Jari"
  
  **Face Recognition Icon**
  - Icon: `Icons.face`
  - Size: 50px
  - Label: "Wajah"

### 3. Main Action Buttons

Three full-width buttons with distinct colors:

#### 1. Change Password Button
- Color: Dark Green (`#1B5E20`)
- Text: **"UBAH PASSWORD"**
- Action: Opens password change dialog with:
  - Old password field
  - New password field
  - Confirm password field

#### 2. My Profile Button
- Color: Orange/Yellow (`#FFA726`)
- Text: **"PROFIL SAYA"**
- Action: Opens detailed profile dialog showing:
  - Name
  - NIS
  - Institution
  - Class
  - Birth place/date
  - Gender
  - Religion
  - Email
  - Phone
  - Address

#### 3. Logout Button
- Color: Maroon/Dark Red (`#8B0000`)
- Text: **"KELUAR"**
- Action: Opens confirmation dialog for logout

### 4. Bottom Navigation

Identical to home page:
- **Home Icon** - Navigate to home page
- **FAB with "M"** - Center floating action button (green)
- **Profile Icon** - Current page (highlighted)

## Features Implemented

✅ Device info header  
✅ Green separator bar  
✅ Profile card with avatar and user details  
✅ Biometric authentication icons panel  
✅ Change password functionality with dialog  
✅ My profile view with complete information  
✅ Logout with confirmation  
✅ Bottom navigation matching home page  
✅ FAB (Floating Action Button) with "M"  

## Color Scheme

| Element | Color Code | Color Name |
|---------|-----------|------------|
| Primary Green | `#2E7D32` | Green |
| Dark Green | `#1B5E20` | Dark Green |
| Orange | `#FFA726` | Orange/Yellow |
| Maroon | `#8B0000` | Dark Red/Maroon |
| Light Grey | `Colors.grey[300]` | Light Grey |
| Border Grey | `Colors.grey[400]` | Medium Grey |

## User Flow

1. User views their profile information in the card
2. Can see biometric options (for future implementation)
3. Can change password via the green button
4. Can view detailed profile via the orange button
5. Can logout via the red button
6. Can navigate back to home via bottom navigation

## Dialog Interactions

### Change Password Dialog
- 3 text fields (old, new, confirm password)
- All fields are obscured (password type)
- Cancel and Save buttons
- Shows success message on save

### My Profile Dialog
- Scrollable content
- Displays all user information
- Close button to dismiss

### Logout Dialog
- Confirmation message
- Cancel and Logout buttons
- Navigates to home and shows success message

## Navigation

- **From Home Page**: Click profile icon in bottom navigation
- **To Home Page**: Click home icon in bottom navigation or logout
- **Current State**: Profile tab is highlighted

## Technical Details

- **Widget Type**: `StatefulWidget` (for managing navigation state)
- **State Management**: Local state with `setState`
- **File Location**: `lib/screens/profile_page.dart`
- **Dependencies**: `home_page.dart` for navigation

## Future Enhancements

1. **Biometric Authentication**
   - Implement actual fingerprint scanning
   - Implement face recognition
   - Link to device biometric APIs

2. **Profile Editing**
   - Allow users to edit their information
   - Upload custom avatar photo
   - Update contact details

3. **Password Management**
   - Backend integration for password change
   - Password strength validation
   - Forgot password flow

4. **Data Persistence**
   - Save user preferences
   - Cache profile data
   - Sync with backend server

## Testing

To test the profile page:

1. Run the application
2. Navigate to home page
3. Click the profile icon in bottom navigation
4. Test all three action buttons
5. Verify dialogs display correctly
6. Test navigation back to home

## Screenshots Required

For complete documentation, add screenshots of:
- [ ] Profile page main view
- [ ] Change password dialog
- [ ] My profile dialog
- [ ] Logout confirmation
- [ ] Bottom navigation interaction

---

**Last Updated**: November 27, 2025  
**Version**: 1.0
