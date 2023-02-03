import 'package:flutter_clean_cli/core/utils/dialog_utils.dart';
import 'package:flutter_clean_cli/models/entities/microfrontend/micro_app.dart';

import 'microfrontend_controller.dart';

class MicroAppController extends MicrofrontendController {
  final MicroApp _microApp;
  MicroAppController(this._microApp);

  @override
  Future run() {
    final projectName = DialogUtils.newQuestion(
      'Enter the name of your ${_microApp.component}, example my_new_app\n(Note: it must not contain blank spaces\nname ${_microApp.component}: ',
    );

    return super.processRun(_microApp, projectName);
  }
}
