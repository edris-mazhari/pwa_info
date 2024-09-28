![ic_pwainfo](https://github.com/user-attachments/assets/19321349-2e4a-4ec3-bc21-cc1fe38c8dba)
Get all info (just) in pwa

## Installation

You just need to add ```pwa_info``` as a dependency in your pubspec.yaml file.

```dart
dependencies:
  pwa_info: ^0.0.1
```

## Get Os Type

call ```PwaInfo().getOS()```  to get os that the user use to open your pwa
and it will return [ios, android, other]

## Get UserAgent

call ```PwaInfo().getUserAgent()```  to get userAgent of browser as String
