import 'dart:typed_data';

import 'package:flutter/material.dart';

class ScrawlPage extends StatefulWidget {
  const ScrawlPage(this.uint8list);

  final Uint8List uint8list;

  @override
  _ScrawlPageState createState() => _ScrawlPageState();
}

class _ScrawlPageState extends State<ScrawlPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            InkResponse(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.save),
              ),
            )
          ],
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(12.0),
          child: Center(child: Image.memory(widget.uint8list)),
        ),
      );
}
