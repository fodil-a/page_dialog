import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the PageDialog plugin.
class PageDialogWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'page_dialog',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = PageDialogWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    throw PlatformException(
      code: 'Unimplemented',
      details: 'page_dialog for web doesn\'t implement \'${call.method}\'',
    );
  }
}
