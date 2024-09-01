import 'package:flutter/material.dart';

class UpwardExpansionTileWidget extends StatefulWidget {
  const UpwardExpansionTileWidget({
    required this.title,
    required this.expandedChild,
    this.enableDragToClose = false,
    super.key,
    this.borderRadius,
  });

  final List<Widget> title;
  final Widget expandedChild;
  final BorderRadiusGeometry? borderRadius;
  final bool
      enableDragToClose; // New parameter to control the drag-to-close feature

  @override
  _UpwardExpansionTileState createState() => _UpwardExpansionTileState();
}

class _UpwardExpansionTileState extends State<UpwardExpansionTileWidget>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    // Check if the user is dragging downward
    if (details.primaryDelta! > 0) {
      setState(() {
        _isExpanded = false;
      });
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    // Ensure the expansion tile is closed after dragging
    if (!_isExpanded) {
      setState(() {
        _isExpanded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if any widget in the title is a GestureDetector
    final hasCustomGestureDetector =
        widget.title.any((child) => child is GestureDetector);
    return GestureDetector(
      onVerticalDragUpdate:
          widget.enableDragToClose && _isExpanded ? _handleDragUpdate : null,
      onVerticalDragEnd:
          widget.enableDragToClose && _isExpanded ? _handleDragEnd : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              // TODO(Himank): need to work on animation later.
              // height: _isExpanded ? 137 : 0.0,
              child: ClipRect(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: _isExpanded ? 1.0 : 0.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.enableDragToClose) ...[
                        Align(
                          child: Container(
                            height: 4,
                            width: 24,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(9),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                      widget.expandedChild,
                      Container(
                        color: Colors.black,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: hasCustomGestureDetector ? null : _toggleExpand,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: widget.title.map((widget) {
                  if (widget is GestureDetector) {
                    return GestureDetector(
                      onTap: _toggleExpand,
                      child: widget.child,
                    );
                  }
                  return widget;
                }).toList()
                  ..add(
                    (!hasCustomGestureDetector)
                        ? AnimatedRotation(
                            turns: _isExpanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 300),
                            child:
                                const Icon(Icons.keyboard_arrow_down_rounded))
                        : const SizedBox.shrink(),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
