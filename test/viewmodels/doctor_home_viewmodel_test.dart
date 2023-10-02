import 'package:flutter_test/flutter_test.dart';
import 'package:pharm/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DoctorHomeViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
