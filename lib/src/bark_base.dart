import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'ffi_rust.dart' as ffi_rust;

int sum(int a, int b) => ffi_rust.sum(a, b);

Pointer<Void> createDefaultConfig() => ffi_rust.create_default_config();
String getAspAddress(Pointer<Void> configPtr) {
  final cStringPtr = ffi_rust.get_asp_address(configPtr);
  final dartString = cStringPtr.toDartString();
  ffi_rust.free_c_string(cStringPtr);
  return dartString;
}
