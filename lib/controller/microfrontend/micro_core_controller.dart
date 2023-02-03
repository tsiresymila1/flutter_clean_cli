import 'dart:io';

import 'package:flutter_clean_cli/core/utils/dialog_utils.dart';
import 'package:flutter_clean_cli/models/entities/microfrontend/micro_core.dart';

import 'microfrontend_controller.dart';

class MicroCoreController extends MicrofrontendController {
  final MicroCore _microCore;
  MicroCoreController(this._microCore);

  @override
  Future run() {
    final projectName = DialogUtils.newQuestion(
      'Enter the name of your ${_microCore.component}\examples: my project\no(note): it must not contain blanks\nname ${_microCore.component}:',
    );

    stdout.write('\n\n');

    return super.processRun(_microCore, projectName);
  }
}
