library tutorial;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app_tutorial/src/models/tutorial_item.dart';
import 'package:app_tutorial/src/painter/painter.dart';

class Tutorial {
  static List<OverlayEntry> entries = [];
  static late int count;

  static Future<void> showTutorial(
      BuildContext context, List<TutorialItem> children,
      {required VoidCallback onTutorialComplete}) async {
    clearEntries();
    final size = MediaQuery.of(context).size;
    OverlayState overlayState = Overlay.of(context);

    count = 0;

    // Create a Completer to indicate when the tutorial is complete
    Completer<void> tutorialCompleter = Completer<void>();

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
                } else {
                  // If this is the last tutorial step, complete the tutorial
                  tutorialCompleter.complete();
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

    // Wait until the tutorialCompleter.future is completed to indicate the tutorial is finished
    await tutorialCompleter.future;

    // If the onTutorialComplete function is provided, call it
    onTutorialComplete();
  }

  static clearEntries() {
    entries.clear();
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
