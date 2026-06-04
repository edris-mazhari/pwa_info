import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

/// Operating system detected from the user agent.
enum DeviceOS {
  ios,
  android,
  other,
}

/// Browser detected from the user agent.
enum BrowserName {
  chrome,
  safari,
  firefox,
  edge,
  samsungInternet,
  opera,
  unknown,
}

/// Container for all PWA environment information.
class PwaInfoResult {
  final DeviceOS os;
  final BrowserName browser;
  final String userAgent;
  final bool isWeb;
  final bool isMobile;
  final bool isStandalone;

  const PwaInfoResult({
    required this.os,
    required this.browser,
    required this.userAgent,
    required this.isWeb,
    required this.isMobile,
    required this.isStandalone,
  });

  @override
  String toString() =>
      'PwaInfoResult(os: $os, browser: $browser, isWeb: $isWeb, '
      'isMobile: $isMobile, isStandalone: $isStandalone)';
}

/// Provides information about the current PWA environment.
///
/// Usage:
/// ```dart
/// final info = PwaInfo();
/// print(info.os);        // DeviceOS.ios
/// print(info.browser);   // BrowserName.chrome
/// print(info.userAgent); // Mozilla/5.0 ...
/// ```
class PwaInfo {
  final String _userAgent;

  PwaInfo({String? userAgent})
      : _userAgent =
            (userAgent ?? html.window.navigator.userAgent).trim().toLowerCase();

  /// Whether the app is running on the web.
  bool get isWeb => kIsWeb;

  /// The raw user agent string (lowercased, trimmed).
  String get userAgent => _userAgent;

  /// Detected operating system.
  DeviceOS get os {
    if (_userAgent.contains('iphone') || _userAgent.contains('ipad')) {
      return DeviceOS.ios;
    }
    if (_userAgent.contains('android')) {
      return DeviceOS.android;
    }
    return DeviceOS.other;
  }

  /// Whether the device is likely a mobile device.
  bool get isMobile {
    // Check for common mobile indicators
    if (_userAgent.contains('mobile') ||
        _userAgent.contains('iphone') ||
        _userAgent.contains('ipad') ||
        (_userAgent.contains('android') && _userAgent.contains('mobile'))) {
      return true;
    }
    return false;
  }

  /// Whether the PWA is running in standalone mode.
  ///
  /// Works on iOS Safari. On other platforms relies on the user agent.
  bool get isStandalone {
    // iOS Safari exposes navigator.standalone
    try {
      final dynamic nav = html.window.navigator;
      if (nav.standalone == true) return true;
    } catch (_) {}

    // Android Chrome adds a display override to the user agent
    if (_userAgent.contains('display-mode: standalone') ||
        _userAgent.contains('displaymode=standalone')) {
      return true;
    }

    return false;
  }

  /// Detected browser name.
  BrowserName get browser {
    if (_userAgent.contains('edg') || _userAgent.contains('edge')) {
      return BrowserName.edge;
    }
    if (_userAgent.contains('opr') || _userAgent.contains('opera')) {
      return BrowserName.opera;
    }
    if (_userAgent.contains('samsungbrowser')) {
      return BrowserName.samsungInternet;
    }
    if (_userAgent.contains('firefox')) {
      return BrowserName.firefox;
    }
    if (_userAgent.contains('chrome') && _userAgent.contains('safari')) {
      return BrowserName.chrome;
    }
    if (_userAgent.contains('safari') && !_userAgent.contains('chrome')) {
      return BrowserName.safari;
    }
    return BrowserName.unknown;
  }

  /// Returns all available information as a single [PwaInfoResult].
  PwaInfoResult get all => PwaInfoResult(
        os: os,
        browser: browser,
        userAgent: _userAgent,
        isWeb: isWeb,
        isMobile: isMobile,
        isStandalone: isStandalone,
      );
}
