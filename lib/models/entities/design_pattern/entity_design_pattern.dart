import 'package:flutter_clean_cli/core/utils/bool_utils.dart';
import 'package:flutter_clean_cli/core/utils/reserved_words.dart';
import 'package:flutter_clean_cli/models/entities/design_pattern/design_pattern.dart';

class EntityDesignPattern extends DesignPattern {
  static const String _template = '''
class {{entityNameClass}} {
  {{entityNameClass.pascalCase}}();
}
  ''';
  @override
  String nameFile() {
    return persistValue(
      'entityNameFile',
      '{{name.snakeCase}}_entity',
    );
  }

  @override
  String path() {
    return persistValue(
      'entityPath',
      'domain/models/entities',
    );
  }

  @override
  String nameClass() {
    return persistValue(
      'entityNameClass',
      '{{name.pascalCase}}Entity',
    );
  }

  @override
  String template() {
    return readTemplete(
      'template',
      'entity.template',
      _template,
      ReservedWords.removeWordsInFile(
        fileString: path(),
      ),
    );
  }

  @override
  String nameDesignPattern() {
    return 'entity';
  }

  @override
  String extension() {
    return persistValue(
      'entityExtension',
      'dart',
    );
  }

  @override
  bool generate() {
    return BoolUtils.parse(persistValue(
      'entityGenerate',
      true,
    ));
  }
}
