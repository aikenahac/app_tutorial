import 'package:flutter/material.dart';
import 'package:app_tutorial/src/models/shape_models.dart';

/// This is the class that will be used to create the shapes
class TutorialItem {
  final GlobalKey globalKey;
  final ShapeFocus shapeFocus;
  final List<Widget> children;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final Color color;
  final Radius borderRadius;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  /// This is the constructor of the class
  TutorialItem({
    required this.globalKey,
    required this.children,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.color = const Color.fromRGBO(0, 0, 0, 0.6),
    this.borderRadius = const Radius.circular(10.0),
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.shapeFocus = ShapeFocus.roundedSquare,
  });
}
