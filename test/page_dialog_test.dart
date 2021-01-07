import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:page_dialog/page_dialog.dart';
import 'package:platform/platform.dart';

class DesktopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PhoneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TabletWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() {
  testWidgets('linux', (tester) async {
    final device = Device(isTablet: true, isPhone: false);
    final platform = FakePlatform(operatingSystem: 'linux');
    final app = _createAppWidget(device: device, platform: platform);

    await tester.pumpWidget(app);

    await tester.tap(find.byType(TextButton));

    await tester.pumpAndSettle();

    expect(find.byType(DesktopWidget), findsOneWidget);
    expect(find.byType(PhoneWidget), findsNothing);
    expect(find.byType(TabletWidget), findsNothing);
  });

  testWidgets('macos', (tester) async {
    final device = Device(isTablet: false, isPhone: false);
    final platform = FakePlatform(operatingSystem: 'macos');
    final app = _createAppWidget(device: device, platform: platform);

    await tester.pumpWidget(app);

    await tester.tap(find.byType(TextButton));

    await tester.pumpAndSettle();

    expect(find.byType(DesktopWidget), findsOneWidget);
    expect(find.byType(PhoneWidget), findsNothing);
    expect(find.byType(TabletWidget), findsNothing);
  });

  testWidgets('windows', (tester) async {
    final device = Device(isTablet: false, isPhone: false);
    final platform = FakePlatform(operatingSystem: 'windows');
    final app = _createAppWidget(device: device, platform: platform);

    await tester.pumpWidget(app);

    await tester.tap(find.byType(TextButton));

    await tester.pumpAndSettle();

    expect(find.byType(DesktopWidget), findsOneWidget);
    expect(find.byType(PhoneWidget), findsNothing);
    expect(find.byType(TabletWidget), findsNothing);
  });

  testWidgets('fuchsia', (tester) async {
    final device = Device(isTablet: false, isPhone: false);
    final platform = FakePlatform(operatingSystem: 'fuchsia');
    final app = _createAppWidget(device: device, platform: platform);

    await tester.pumpWidget(app);

    await tester.tap(find.byType(TextButton));

    await tester.pumpAndSettle();

    expect(find.byType(DesktopWidget), findsOneWidget);
    expect(find.byType(PhoneWidget), findsNothing);
    expect(find.byType(TabletWidget), findsNothing);
  });

  testWidgets('tablet', (tester) async {
    final device = Device(isTablet: true, isPhone: false);
    final platform = FakePlatform(operatingSystem: 'notDesktop');
    final app = _createAppWidget(device: device, platform: platform);

    await tester.pumpWidget(app);

    await tester.tap(find.byType(TextButton));

    await tester.pumpAndSettle();

    expect(find.byType(DesktopWidget), findsNothing);
    expect(find.byType(PhoneWidget), findsNothing);
    expect(find.byType(TabletWidget), findsOneWidget);
  });

  testWidgets('phone', (tester) async {
    final device = Device(isTablet: false, isPhone: true);
    final platform = FakePlatform(operatingSystem: 'notDesktop');

    final app = _createAppWidget(device: device, platform: platform);

    await tester.pumpWidget(app);

    await tester.tap(find.byType(TextButton));

    await tester.pumpAndSettle();

    expect(find.byType(DesktopWidget), findsNothing);
    expect(find.byType(PhoneWidget), findsOneWidget);
    expect(find.byType(TabletWidget), findsNothing);
  });

  testWidgets('web', (tester) async {
    final device = Device(isTablet: false, isPhone: true);
    final platform = FakePlatform(operatingSystem: 'notDesktop');

    final app =
        _createAppWidget(device: device, platform: platform, isWeb: true);

    await tester.pumpWidget(app);

    await tester.tap(find.byType(TextButton));

    await tester.pumpAndSettle();

    expect(find.byType(DesktopWidget), findsNothing);
    expect(find.byType(PhoneWidget), findsNothing);
    expect(find.byType(TabletWidget), findsNothing);
  });
}

MaterialApp _createAppWidget(
    {Device device, Platform platform, bool isWeb = false}) {
  return MaterialApp(
    onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
      return Container(
        child: TextButton(
          child: Text('click'),
          onPressed: () => showPageDialog(context,
              routeOnPhone: MaterialPageRoute(builder: (_) => PhoneWidget()),
              desktopBuilder: (_) => DesktopWidget(),
              tabletBuilder: (_) => TabletWidget(),
              onWeb: (_) async {},
              device: device,
              platform: platform,
              isWeb: isWeb),
        ),
      );
    }),
  );
}
