import 'package:flutter_test/flutter_test.dart';
import 'package:pwa_info/pwa_info.dart';

void main() {
  group('DeviceOS detection', () {
    test('detects iOS from iPhone user agent', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1',
      );
      expect(pwaInfo.os, DeviceOS.ios);
    });

    test('detects iOS from iPad user agent', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (iPad; CPU OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1',
      );
      expect(pwaInfo.os, DeviceOS.ios);
    });

    test('detects Android from user agent', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (Linux; Android 13; SM-S908B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36',
      );
      expect(pwaInfo.os, DeviceOS.android);
    });

    test('returns other for desktop user agents', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',
      );
      expect(pwaInfo.os, DeviceOS.other);
    });
  });

  group('BrowserName detection', () {
    test('detects Chrome', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',
      );
      expect(pwaInfo.browser, BrowserName.chrome);
    });

    test('detects Safari', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/604.1',
      );
      expect(pwaInfo.browser, BrowserName.safari);
    });

    test('detects Firefox', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0',
      );
      expect(pwaInfo.browser, BrowserName.firefox);
    });

    test('detects Edge', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.48',
      );
      expect(pwaInfo.browser, BrowserName.edge);
    });

    test('detects Opera', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 OPR/96.0.0.0',
      );
      expect(pwaInfo.browser, BrowserName.opera);
    });

    test('detects Samsung Internet', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (Linux; Android 13; SM-S908B) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/21.0 Chrome/110.0.5481.154 Mobile Safari/537.36',
      );
      expect(pwaInfo.browser, BrowserName.samsungInternet);
    });
  });

  group('isMobile detection', () {
    test('returns true for iPhone user agent', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1',
      );
      expect(pwaInfo.isMobile, true);
    });

    test('returns true for Android mobile user agent', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (Linux; Android 13; SM-S908B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36',
      );
      expect(pwaInfo.isMobile, true);
    });

    test('returns false for desktop user agent', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',
      );
      expect(pwaInfo.isMobile, false);
    });
  });

  group('PwaInfoResult', () {
    test('returns all information', () {
      final pwaInfo = PwaInfo(
        userAgent:
            'Mozilla/5.0 (Linux; Android 13; SM-S908B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36',
      );
      final result = pwaInfo.all;

      expect(result.os, DeviceOS.android);
      expect(result.browser, BrowserName.chrome);
      expect(result.isMobile, true);
      expect(result.userAgent, isNotEmpty);
      expect(result.toString(), contains('PwaInfoResult'));
    });
  });
}
