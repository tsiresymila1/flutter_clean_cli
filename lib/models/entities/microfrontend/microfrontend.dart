import 'dart:convert';
import 'dart:io';

abstract class Microfrontend {
  String get component;
  String get prefix;

  Microfrontend();

  String projectNameComplete(String projectName) {
    final args = [];
    if (prefix.isNotEmpty) {
      args.add(prefix);
    }
    if (component.isNotEmpty) {
      args.add(component);
    }
    args.add(projectName);
    return args.join(divider);
  }

  String get divider {
    return persistValue(
      'divider',
      '_',
    );
  }

  String persistValue(String key, String value) {
    final configs = _readConfigs();
    if (!configs.containsKey(key)) {
      configs[key] = value;
      _writeConfigs(configs);
    }

    return configs[key];
  }

  Map<String, dynamic> _readConfigs() {
    var existFile =
        File('.flutter_clean_cli/configs_microfrontend.json').existsSync();

    if (!existFile) {
      Directory('.flutter_clean_cli').createSync();

      File('.flutter_clean_cli/configs_microfrontend.json')
          .writeAsStringSync('{}');
    }

    return json.decode(
      File('.flutter_clean_cli/configs_microfrontend.json').readAsStringSync(),
    );
  }

  void _writeConfigs(Map<String, dynamic> configs) {
    File('.flutter_clean_cli/configs_microfrontend.json').writeAsStringSync(
      json.encode(configs),
    );
  }
}
