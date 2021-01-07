import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:platform/platform.dart';

/// [showPageDialog] shows a Page or a Dialog depending on the device.
/// If [platform], [device] and [isWeb] are null, the method will figure
/// out what platform it runs on.
/// If the device is a phone, it will open the [Route] you pass as [routeOnPhone].
/// If the device is a desktop or a tablet, it will open the [Dialog] you pass as a result of the call to [desktopBuilder] if the device is a desktop
/// or [tabletBuilder] if the device is a tablet.
/// Last, if the device is web, it is not possible to figure out if the device
/// is a phone, a tablet or desktop, so you will have a callback [onWeb]
/// where you will choose was to do.
/// You can force a device by passing all three arguments [platform],
/// [device] and [isWeb].
Future<T> showPageDialog<T>(BuildContext context,
    {@required Route<T> routeOnPhone,
    @required Widget Function(BuildContext) desktopBuilder,
    @required Widget Function(BuildContext) tabletBuilder,
    @required Future<T> Function(BuildContext) onWeb,
    Platform platform,
    Device device,
    bool isWeb}) {
  isWeb ??= kIsWeb;

  if (isWeb) return onWeb(context);

  platform ??= LocalPlatform();
  device ??= Device.get();

  if (_isDesktop(platform))
    return showDialog(context: context, builder: desktopBuilder);

  if (device.isTablet)
    return showDialog(context: context, builder: tabletBuilder);

  return Navigator.of(context).push(routeOnPhone);
}

bool _isDesktop(Platform platform) =>
    platform.isFuchsia ||
    platform.isLinux ||
    platform.isMacOS ||
    platform.isWindows;
