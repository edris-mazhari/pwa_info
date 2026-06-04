# pwa_info

A Flutter package for detecting device and browser information in Progressive Web Apps (PWAs).

[![pub package](https://img.shields.io/pub/v/pwa_info.svg)](https://pub.dev/packages/pwa_info)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Features

- **OS detection** — identify iOS, Android, or other platforms
- **Browser detection** — detect Chrome, Safari, Firefox, Edge, Opera, Samsung Internet
- **Mobile check** — determine if the device is mobile
- **PWA standalone mode** — check if running as a standalone PWA
- **User agent** — access the raw user agent string

## Installation

Add `pwa_info` to your `pubspec.yaml`:

```yaml
dependencies:
  pwa_info: ^1.1.0
```

Then run:

```sh
flutter pub get
```

## Usage

```dart
import 'package:pwa_info/pwa_info.dart';

final info = PwaInfo();

// Operating system
print(info.os); // DeviceOS.ios, DeviceOS.android, or DeviceOS.other

// Browser
print(info.browser); // BrowserName.chrome, BrowserName.safari, etc.

// User agent string
print(info.userAgent); // "Mozilla/5.0 (iPhone; CPU iPhone OS ..."

// Mobile check
print(info.isMobile); // true or false

// PWA standalone check
print(info.isStandalone); // true if running in standalone mode

// Get everything at once
final result = info.all;
print(result);
```

## API

### `PwaInfo`

| Member | Type | Description |
|---|---|---|
| `os` | `DeviceOS` | Detected operating system |
| `browser` | `BrowserName` | Detected browser |
| `userAgent` | `String` | Raw user agent string (lowercased) |
| `isWeb` | `bool` | Whether running on web (`kIsWeb`) |
| `isMobile` | `bool` | Whether the device is mobile |
| `isStandalone` | `bool` | Whether running in PWA standalone mode |
| `all` | `PwaInfoResult` | All properties as a single object |

### `DeviceOS`

| Value | Description |
|---|---|
| `ios` | iPhone or iPad |
| `android` | Android device |
| `other` | Desktop or unknown |

### `BrowserName`

| Value | Description |
|---|---|
| `chrome` | Google Chrome |
| `safari` | Apple Safari |
| `firefox` | Mozilla Firefox |
| `edge` | Microsoft Edge |
| `opera` | Opera |
| `samsungInternet` | Samsung Internet Browser |
| `unknown` | Unrecognized browser |

## Example

See the [example](example/) directory for a complete Flutter web app.

## License

This project is licensed under the BSD 3-Clause License — see the [LICENSE](LICENSE) file for details.
