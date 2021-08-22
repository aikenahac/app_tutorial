library tutorial;

import 'package:flutter/material.dart';
import 'package:app_tutorial/src/models/tutorial_items.dart';
import 'package:app_tutorial/src/painter/painter.dart';

/// This is the main class of the app.
class Tutorial {
  /// The method that shows the tutorial
  static showTutorial(
      BuildContext context, List<TutorialItems> children) async {
    int count = 0;
    var size = MediaQuery.of(context).size;
    OverlayState overlayState = Overlay.of(context)!;
    List<OverlayEntry> entries = [];
    children.forEach((element) async {
      var offset = _capturePositionWidget(element.globalKey!);
      var sizeWidget = _getSizeWidget(element.globalKey!);
      entries.add(
        OverlayEntry(
          builder: (context) {
            return GestureDetector(
              onTap: element.touchScreen == true
                  ? () {
                      entries[count].remove();
                      count++;
                      if (count != entries.length) {
                        overlayState.insert(entries[count]);
                      }
                    }
                  : () {},
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
                          borderRadius: element.borderRadius),
                    ),
                    Positioned(
                      top: element.top,
                      bottom: element.bottom,
                      left: element.left,
                      right: element.right,
                      child: Container(
                        width: size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: element.crossAxisAlignment,
                          mainAxisAlignment: element.mainAxisAlignment,
                          children: [
                            ...element.children!,
                            GestureDetector(
                              child: element.widgetNext ??
                                  Text(
                                    "NEXT",
                                    style: TextStyle(color: Colors.white),
                                  ),
                              onTap: () {
                                entries[count].remove();
                                count++;
                                if (count != entries.length) {
                                  overlayState.insert(entries[count]);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    )
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

  /// This method returns the position of the widget
  static Offset _capturePositionWidget(GlobalKey key) {
    RenderBox renderPosition =
        key.currentContext!.findRenderObject() as RenderBox;

    return renderPosition.localToGlobal(Offset.zero);
  }

  /// This method returns the size of the widget
  static Size _getSizeWidget(GlobalKey key) {
    RenderBox renderSize = key.currentContext!.findRenderObject() as RenderBox;
    return renderSize.size;
  }
}
