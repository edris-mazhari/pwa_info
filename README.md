Get all info (just) in pwa

## Installation

You just need to add ```pwa_info``` as a dependency in your pubspec.yaml file.

```dart
dependencies:
  pwa_info: ^0.0.1
```

## Get Os Type

call PwaInfo().getOS()  to get os that the user use to open your pwa
and it will return [ios, android, other]

## Get UserAgent

call PwaInfo().getUserAgent()  to get userAgent of browser as String