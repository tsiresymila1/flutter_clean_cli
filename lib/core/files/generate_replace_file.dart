import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean_cli/core/utils/directory_utils.dart';
import 'package:flutter_clean_cli/core/utils/reserved_words.dart';
import 'package:flutter_clean_cli/models/dtos/replace_dto.dart';
import 'package:flutter_clean_cli/core/utils/path.dart';

class GenerateReplaceFile {
  static List<ReplaceDto> read(
    String group,
    String path,
    String prefixNameReplaceFile,
  ) {
    final file = '${prefixNameReplaceFile}_replace_trigger.json';
    var root = '.flutter_clean_cli';

    path = normalize(ReservedWords.removeWordsInFile(
      fileString: '$group/$path',
    ));

    var existFile = File('$root/$path/$file').existsSync();

    if (!existFile) {
      DirectoryUtils.create(root + '/' + path);

      File('$root/$path/$file').writeAsStringSync(
        json.encode(
          [
            ReplaceDto('', '', '').toJson(),
          ],
        ),
      );
    }

    return (json.decode(File('$root/$path/$file').readAsStringSync()) as List)
        .map((e) => ReplaceDto.fromJson(e))
        .toList();
  }
}
