import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _repaintKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: RepaintBoundary(
            key: _repaintKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/food.jpeg', fit: BoxFit.cover),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Click image to add watermark'),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        '    Paint your app to life in milliseconds with stateful Hot Reload. Use a rich set of fully-customizable widgets to build native interfaces in minutes.\n\n'
                            '    Quickly ship features with a focus on native end-user experiences. Layered architecture allows for full customization, which results in incredibly fast rendering and expressive and flexible designs.\n\n'
                            '    Flutter’s widgets incorporate all critical platform differences such as scrolling, navigation, icons and fonts to provide full native performance on both iOS and Android.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          height: 1.2
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: FloatingActionButton.extended(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('去涂鸦'),
          ),
        ),
      );
}
