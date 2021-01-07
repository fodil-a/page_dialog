//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <page_dialog/page_dialog_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) page_dialog_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PageDialogPlugin");
  page_dialog_plugin_register_with_registrar(page_dialog_registrar);
}
