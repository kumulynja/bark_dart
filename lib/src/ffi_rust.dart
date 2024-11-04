// ignore_for_file: non_constant_identifier_names

@DefaultAsset('package:bark/bark_ffi_plugin')
library rust;

import 'dart:ffi';
import 'package:ffi/ffi.dart' as ffi;

@Native<IntPtr Function(IntPtr, IntPtr)>()
external int sum(
  int a,
  int b,
);

@Native<Pointer<Void> Function()>()
external Pointer<Void> create_default_config();

// Define a function to destroy a Config instance
@Native<Void Function(Pointer<Void>)>()
external void destroy_config(Pointer<Void> configPtr);

// Define a function to get `asp_address` as a pointer to C string
@Native<Pointer<ffi.Utf8> Function(Pointer<Void>)>()
external Pointer<ffi.Utf8> get_asp_address(Pointer<Void> configPtr);

// Define a function to free the C string returned by `getAspAddress`
@Native<Void Function(Pointer<ffi.Utf8>)>()
external void free_c_string(Pointer<ffi.Utf8> cStringPtr);
