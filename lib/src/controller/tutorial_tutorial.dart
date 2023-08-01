library tutorial;

import 'package:flutter/material.dart';
import 'package:app_tutorial/src/models/tutorial_item.dart';
import 'package:app_tutorial/src/painter/painter.dart';

/// This is the main class of the app.
class Tutorial {
  static List<OverlayEntry> entries = [];
  static late int count;

  /// The method that shows the tutorial
  static showTutorial(BuildContext context, List<TutorialItem> children) async {
    var size = MediaQuery.of(context).size;
    OverlayState overlayState = Overlay.of(context);

    count = 0;

    children.forEach((element) async {
      final offset = _capturePositionWidget(element.globalKey);
      final sizeWidget = _getSizeWidget(element.globalKey);
      entries.add(
        OverlayEntry(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                entries[count].remove();
                count++;
                if (count < entries.length) {
                  overlayState.insert(entries[count]);
                }
              },
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    CustomPaint(
                      size: size,
                      painter: HolePainter(
                        shapeFocus: element.shapeFocus,
                        dx: offset.dx + (sizeWidget.width / 2),
                        dy: offset.dy + (sizeWidget.height / 2),
                        width: sizeWidget.width,
                        height: sizeWidget.height,
                        color: element.color,
                        borderRadius: element.borderRadius,
                        radius: element.radius,
                      ),
                    ),
                    element.child,
                  ],
                ),
              ),
            );
          },
        ),
      );
    });

    overlayState.insert(entries[0]);
  }

  static skipAll(BuildContext context) {
    entries[count].remove();
    count++;
  }

  /// This method returns the position of the widget
  static Offset _capturePositionWidget(GlobalKey key) {
    RenderBox renderPosition =
        key.currentContext?.findRenderObject() as RenderBox;

    return renderPosition.localToGlobal(Offset.zero);
  }

  /// This method returns the size of the widget
  static Size _getSizeWidget(GlobalKey key) {
    RenderBox renderSize = key.currentContext?.findRenderObject() as RenderBox;
    return renderSize.size;
  }
}
