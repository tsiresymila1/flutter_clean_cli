import '../../../core/utils/output_utils.dart' as output;

class HelpCommandController {
  void call() {
    output.warn(
      '''
-------------------------- HELPS --------------------------

i, init Generate the project's configurable files...
Example: flutter_clean_cli init

mf, microfrontend Select the option to create new microfrontend components...
Example: flutter_clean_cli mf

l, layer Generates the folder structure of a module...
Example: flutter_clean_cli g l lib/app/modules/module_name

p, page Create a new page with a controller...
Example: flutter_clean_cli g p lib/app/modules/module_name Name

c, controller Create a new controller...
Example: flutter_clean_cli g c lib/app/modules/module_name Name

d, datasource Create the fetching layer data from external sources...
Example: flutter_clean_cli g d lib/app/modules/module_name Name

r, repository Create the layer to handle the data...
Example: flutter_clean_cli g r lib/app/modules/module_name Name

u, usecase Create the layer to handle the business rules...
Example: flutter_clean_cli g u lib/app/modules/module_name Name

s, service Create the layer to handle services...
Example: flutter_clean_cli g s lib/app/modules/module_name Name

e, entity Create the entities...
Example: flutter_clean_cli g e lib/app/modules/module_name Name

dto Create the dto for data transfer...
Example: flutter_clean_cli g dto lib/app/modules/module_name Name
''',
    );
  }
}
