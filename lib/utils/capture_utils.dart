import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';

Future<Uint8List> getUint8List(RenderRepaintBoundary boundary) async {
  final image = await boundary.toImage(pixelRatio: window.devicePixelRatio);
  final byteData = await image.toByteData(format: ImageByteFormat.png);
  return byteData.buffer.asUint8List();
}
