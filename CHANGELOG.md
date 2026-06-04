## 1.2.0

- Updated `universal_html` dependency to `^2.3.0`
- Updated `flutter_lints` to `^6.0.0`
- Minor cleanup and lint fixes

## 1.1.0

- **Breaking:** Replaced `getOS()` / `getUserAgent()` methods with `os` / `userAgent` getters
- Added `browser` getter with `BrowserName` enum (Chrome, Safari, Firefox, Edge, Opera, Samsung Internet)
- Added `isMobile` getter
- Added `isStandalone` getter for PWA standalone mode detection
- Added `isWeb` getter
- Added `all` getter returning a `PwaInfoResult` object
- Improved documentation and test coverage

## 0.0.2

- Initial release with OS detection and user agent access
