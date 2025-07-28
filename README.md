# flutter_webview

**Basic Flutter WebView App**  
A simple Flutter project that displays web content inside a native WebView, with Firebase Remote Config integration for dynamic URLs.

---

## **Features**
- **WebView** using `webview_flutter`
- **Firebase Remote Config** for managing dynamic web URLs
---

## **Dependencies**
- `webview_flutter` – Web content display
- `firebase_core` & `firebase_remote_config` – Firebase integration
- `flutter_native_splash` – Native splash screen
- `auto_route` – Declarative routing
- `get_it` – Service locator for dependency injection
- `loading_indicator` – Custom loading animations

---

## **Setup**
1. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

2. **Set up Firebase**
    - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
    - Enable **Remote Config** in Firebase Console

3. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```