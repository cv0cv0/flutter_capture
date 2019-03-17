import 'dart:typed_data';

import 'package:flutter/material.dart';

class ScrawlPage extends StatefulWidget {
  const ScrawlPage(this.uint8list);

  final Uint8List uint8list;

  @override
  _ScrawlPageState createState() => _ScrawlPageState();
}

class _ScrawlPageState extends State<ScrawlPage> {
  final _boundaryKey = GlobalKey();

  static final _strokeWidths = [5.0, 7.5, 10.0];
  static final _paintColors = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent
  ];

  static var _strokeWidthIndex = 0;
  static var _paintColorIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: RepaintBoundary(
                    key: _boundaryKey,
                    child: Image.memory(widget.uint8list),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _actions(),
                  ),
                )
              ],
            )),
      );

  List<Widget> _actions() => [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.close),
        ),
      ]
        ..addAll(List.generate(
            3,
            (index) => GestureDetector(
                  onTap: () => setState(() {
                        _strokeWidthIndex = index;
                      }),
                  child: Icon(
                    Icons.brightness_1,
                    size: 10.0 + 5.0 * index,
                    color: _strokeWidthIndex == index
                        ? Colors.black87
                        : Colors.grey.withOpacity(0.5),
                  ),
                )))
        ..addAll(List.generate(
            3,
            (index) => GestureDetector(
                  onTap: () => setState(() {
                        _paintColorIndex = index;
                      }),
                  child: Container(
                    color: _paintColorIndex == index
                        ? Colors.grey.withOpacity(0.2)
                        : Colors.transparent,
                    child: Icon(
                      Icons.create,
                      color: _paintColors[index],
                    ),
                  ),
                )))
        ..addAll([
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.replay),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.save),
          ),
        ]);
}
