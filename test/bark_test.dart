import 'package:bark/bark.dart';

import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('FFI call works', () {
      final defaultConfig = createDefaultConfig();
      final aspAddress = getAspAddress(defaultConfig);

      print('ASP Address: $aspAddress');

      expect(aspAddress, 'http://127.0.0.1:3535');

      final result = sum(10, 15);
      expect(result, 25);
    });
  });
}
