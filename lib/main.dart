import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Flutter Capture",
        home: HomePage(),
      );
}
