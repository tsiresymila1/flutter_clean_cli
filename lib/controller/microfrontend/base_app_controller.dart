import 'dart:io';

import 'package:flutter_clean_cli/core/utils/dialog_utils.dart';
import 'package:flutter_clean_cli/models/entities/microfrontend/base_app.dart';

import 'microfrontend_controller.dart';

class BaseAppController extends MicrofrontendController {
  final BaseApp _baseApp;
  BaseAppController(this._baseApp);

  @override
  Future run() {
    final projectName = DialogUtils.newQuestion(
      'Enter the name of your ${_baseApp.component}, example my_new_project\no(note): it must not contain white space\nname ${_baseApp.component}: ',
    );
    stdout.write('\n\n');
    final org = DialogUtils.newQuestion(
      'To create your ${_baseApp.component} you need to enter a package where the applicationId will be used on Android and bundleId on iOS\nExample package: com.example.company.name_project\nType package:',
    );
    stdout.write('\n\n');
    return super.processRun(_baseApp, projectName, org: org);
  }
}
