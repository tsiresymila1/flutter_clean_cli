import 'dart:io';

import 'package:flutter_clean_cli/core/utils/dialog_utils.dart';
import 'package:flutter_clean_cli/models/entities/microfrontend/micro_commons.dart';

import 'microfrontend_controller.dart';

class MicroCommonsController extends MicrofrontendController {
  final MicroCommons _microCommons;
  MicroCommonsController(this._microCommons);

  @override
  Future run() {
    final projectName = DialogUtils.newQuestion(
      'Enter the name of your ${_microCommons.component}\examples: auth, dependencies, utils, extensions...\n(obs): must not contain blanks\nname ${_microCommons.component}:',
    );
    stdout.write('\n\n');
    return super.processRun(_microCommons, projectName);
  }
}
