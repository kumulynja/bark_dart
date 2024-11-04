import 'dart:io';

import 'package:logging/logging.dart';

import 'package:native_toolchain_rust/native_toolchain_rust.dart';
import 'package:native_assets_cli/native_assets_cli.dart';

void main(List<String> args) async {
  try {
    await build(args, (BuildConfig buildConfig, BuildOutput output) async {
      final builder = RustBuilder(
        package: buildConfig.packageName,
        cratePath: 'rust',
        buildConfig: buildConfig,
        logger: Logger('')
          ..level = Level.ALL
          ..onRecord.listen((record) {
            print(record.message);
          }),
      );
      await builder.run(output: output);
    });
  } catch (e) {
    print(e);
    exit(1);
  }
}
