library pwa_info;

import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

enum DeviceOS { ios, android, other }

/// Please make sure you use [kIsWeb] condition before you use this package
/// you can get [DeviceOS] by calling PwaInfo().getOS()
/// also you can get [UserAgent] of your user by calling PwaInfo().getUserAgent()
class PwaInfo {
  late String _userAgent;

  PwaInfo() {
    if (!kIsWeb) throw ErrorDescription('use kIsWeb before calling the function');
    _userAgent = html.window.navigator.userAgent.trim().toString().toLowerCase();
  }

  /// Get Operating system type
  /// [ios] contains [iphone] and [ipad] devices
  /// [android] contains android devices
  /// [other] contains non [ios] and [android] like web browsers and ....
  DeviceOS getOS() {
    if (_userAgent.contains("iphone") || _userAgent.contains("ipad")) {
      return DeviceOS.ios;
    } else if (_userAgent.contains("android")) {
      return DeviceOS.android;
    } else {
      return DeviceOS.other;
    }
  }

  /// Get user agent info as String
  String getUserAgent() {
    return _userAgent;
  }
}
