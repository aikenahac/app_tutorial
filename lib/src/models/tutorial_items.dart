import 'package:flutter/material.dart';
import 'package:app_tutorial/src/models/shape_models.dart';

/// This is the class that will be used to create the shapes
class TutorialItems {
  final GlobalKey? globalKey;
  final ShapeFocus? shapeFocus;
  final List<Widget>? children;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final Widget? widgetNext;
  final Color? color;
  final Radius? borderRadius;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final bool touchScreen;

  /// This is the constructor of the class
  TutorialItems({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.globalKey,
    this.children,
    this.shapeFocus,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.widgetNext,
    this.color,
    this.borderRadius,
    this.touchScreen = false,
  });
}
