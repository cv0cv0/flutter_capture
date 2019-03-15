import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'scrawl_page.dart';

class HomePage extends StatelessWidget {
  final _boundaryKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: RepaintBoundary(
            key: _boundaryKey,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Image.asset('assets/food.jpeg', fit: BoxFit.cover),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        '    Paint your app to life in milliseconds with stateful Hot Reload. Use a rich set of fully-customizable widgets to build native interfaces in minutes.\n\n'
                            '    Quickly ship features with a focus on native end-user experiences. Layered architecture allows for full customization, which results in incredibly fast rendering and expressive and flexible designs.\n\n'
                            '    Flutter’s widgets incorporate all critical platform differences such as scrolling, navigation, icons and fonts to provide full native performance on both iOS and Android.',
                        style: TextStyle(
                            color: Colors.black, fontSize: 17.0, height: 1.2),
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
            icon: Icon(Icons.add),
            label: Text('去涂鸦'),
            onPressed: () => _toScrawlPage(context),
          ),
        ),
      );

  Future _toScrawlPage(BuildContext context) async {
    final boundary =
        _boundaryKey.currentContext.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: window.devicePixelRatio);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final uint8List = byteData.buffer.asUint8List();

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ScrawlPage(uint8List)),
    );
  }
}
