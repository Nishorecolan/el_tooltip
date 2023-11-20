import 'package:el_tooltip_example/el_tooltip.dart';
import 'package:el_tooltip_example/src/arrow.dart';
import 'package:el_tooltip_example/src/bubble.dart';
import 'package:el_tooltip_example/src/element_box.dart';
import 'package:el_tooltip_example/src/modal.dart';
import 'package:el_tooltip_example/src/tooltip_elements_display.dart';
import 'package:flutter/material.dart';

import '../el_tooltip.dart';

class ElTooltipOverlay extends StatefulWidget {
  const ElTooltipOverlay({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14.0),
    this.showModal = true,
    this.showArrow = true,
    this.showChildAboveOverlay = true,
    this.modalConfiguration = const ModalConfiguration(),
    required this.toolTipElementsDisplay,
    required this.color,
    required this.content,
    required this.hideOverlay,
    required this.triggerBox,
    required this.arrowBox,
    required this.appearAnimationDuration,
    required this.disappearAnimationDuration,
    this.longTailPosition = 'Center',
  });

  /// [child] Widget that will trigger the tooltip to appear.
  final Widget child;

  /// [color] Background color of the tooltip and the arrow.
  final Color color;

  /// [content] Widget that appears inside the tooltip.
  final Widget content;

  /// [padding] Space inside the tooltip - around the content.
  final EdgeInsetsGeometry padding;

  /// [showModal] Shows a dark layer behind the tooltip.
  final bool showModal;

  /// [showArrow] Shows an arrow pointing to the trigger.
  final bool showArrow;

  /// [showChildAboveOverlay] Shows the child above the overlay.
  final bool showChildAboveOverlay;

  /// [modalConfiguration] Configures the [Modal] widget
  /// Only used if [showModal] is true
  final ModalConfiguration modalConfiguration;

  /// [toolTipElementsDisplay] Contains the position of the tooltip, the arrow and the trigger
  final ToolTipElementsDisplay toolTipElementsDisplay;

  /// [hideOverlay] Function that hides the overlay
  final VoidCallback hideOverlay;

  /// [triggerBox] Box that contains the trigger
  final ElementBox triggerBox;

  /// [arrowBox] Box that contains the arrow
  final ElementBox arrowBox;

  /// [appearAnimationDuration] Duration of the appear animation of the modal
  /// The default value is 0 which means it doesn't animate
  final Duration appearAnimationDuration;

  /// [disappearAnimationDuration] Duration of the disappear animation of the modal
  /// The default value is 0 which means it doesn't animate
  final Duration disappearAnimationDuration;

  final String longTailPosition;

  @override
  State<ElTooltipOverlay> createState() => ElTooltipOverlayState();
}

class ElTooltipOverlayState extends State<ElTooltipOverlay> {
  bool closing = false;
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => show());
  }

  Future<void> show() async {
    setState(() {
      closing = false;
      opacity = 1;
    });
    await Future.delayed(widget.appearAnimationDuration);
  }

  Future<void> hide() async {
    setState(() {
      closing = true;
      opacity = 0;
    });
    await Future.delayed(widget.disappearAnimationDuration);
  }

  @override
  Widget build(BuildContext context) {
    print('value is ${widget.toolTipElementsDisplay.arrow.y}');
    return AnimatedOpacity(
      opacity: opacity,
      duration: closing
          ? widget.disappearAnimationDuration
          : widget.appearAnimationDuration,
      child: Stack(
        children: [
          Modal(
            color: widget.modalConfiguration.color,
            opacity: widget.modalConfiguration.opacity,
            visible: widget.showModal,
            onTap: widget.hideOverlay,
          ),
          Positioned(
            top: widget.toolTipElementsDisplay.bubble.y,
            left: widget.toolTipElementsDisplay.bubble.x,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 3,
                   spreadRadius: 5,
                   offset: Offset(0, 5), // Shadow position
                  ),
                ],
              ),
              child: Bubble(
                triggerBox: widget.triggerBox,
                padding: widget.padding,
                radius: widget.toolTipElementsDisplay.radius,
                color: widget.color,
                child: widget.content,
              ),
            ),
          ),
          if (widget.showArrow)
            Positioned(
              // top: widget.toolTipElementsDisplay.arrow.y,
              // left: widget.toolTipElementsDisplay.arrow.x,
              top: widget.toolTipElementsDisplay.position == ElTooltipPosition.topStart ||
                      widget.toolTipElementsDisplay.position == ElTooltipPosition.topEnd ||
                      widget.toolTipElementsDisplay.position == ElTooltipPosition.topCenter
                  ? widget.toolTipElementsDisplay.arrow.y
                  : widget.toolTipElementsDisplay.arrow.y - 20,
              left: widget.longTailPosition == 'Right'
                  ? widget.toolTipElementsDisplay.arrow.x - 19
                  : widget.longTailPosition == 'Center' ? widget.toolTipElementsDisplay.arrow.x - 10
                  // : widget.toolTipElementsDisplay.arrow.x ,
                  : widget.toolTipElementsDisplay.arrow.x + 2, ///changes
              child: Arrow(
                color: widget.color,
                position: widget.toolTipElementsDisplay.position,
                width: widget.longTailPosition == 'Center' ? 35 : widget.longTailPosition == 'Left' ? 35 : 35,
                height: 30,
                // width: widget.arrowBox.w,
                // height: widget.arrowBox.h,
              ),
            ),
          if (widget.showChildAboveOverlay)
            Positioned(
              top: widget.triggerBox.y,
              left: widget.triggerBox.x,
              child: GestureDetector(
                onTap: widget.hideOverlay,
                child: widget.child,
              ),
            ),
        ],
      ),
    );
  }
}
