import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean_cli/core/utils/directory_utils.dart';

abstract class DesignPattern {
  String extension();
  String nameClass();
  String nameFile();
  String path();
  String template();
  String nameDesignPattern();
  bool generate();

  String readTemplete(
    String group,
    String file,
    String template,
    String path,
  ) {
    var root = '.flutter_clean_cli';

    path = '$group/$path';

    var existFile = File('$root/$path/$file').existsSync();

    if (!existFile) {
      DirectoryUtils.create('$root/$path');
      File('$root/$path/$file').writeAsStringSync(template);
    }

    return File('$root/$path/$file').readAsStringSync();
  }

  dynamic persistValue(String key, dynamic value) {
    final configs = _readConfigs();
    if (!configs.containsKey(key)) {
      configs[key] = value;
      _writeConfigs(configs);
    }

    return configs[key];
  }

  Map<String, dynamic> _readConfigs() {
    var existFile = File('.flutter_clean_cli/configs.json').existsSync();

    if (!existFile) {
      Directory('.flutter_clean_cli').createSync();

      File('.flutter_clean_cli/configs.json').writeAsStringSync('{}');
    }

    return json.decode(
      File('.flutter_clean_cli/configs.json').readAsStringSync(),
    );
  }

  void _writeConfigs(Map<String, dynamic> configs) {
    File('.flutter_clean_cli/configs.json').writeAsStringSync(
      json.encode(configs),
    );
  }
}
