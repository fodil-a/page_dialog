import 'package:flutter/material.dart';

import 'package:page_dialog/page_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Page dialog app'),
        ),
        body: Center(
          child: PageDialogButton(),
        ),
      ),
    );
  }
}

class PageDialogButton extends StatelessWidget {
  const PageDialogButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('What will happen ?'),
      onPressed: () {
        showPageDialog(
          context,
          routeOnPhone: MaterialPageRoute(
            builder: (context) => Text('on phone'),
          ),
          desktopBuilder: (_) => Dialog(child: Text('on desktop')),
          tabletBuilder: (_) => Dialog(child: Text('on tablet')),
          onWeb: (_) => showDialog(
              context: context, builder: (_) => Dialog(child: Text('on web'))),
        );
      },
    );
  }
}
