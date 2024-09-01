import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatefulWidget {
  const ExpansionTileWidget({
    required this.title,
    required this.children,
    super.key,
    this.isExpanded = false,
    this.onExpansionChanged,
    this.animationDuration = const Duration(milliseconds: 300),
  });
  final Widget title;
  final List<Widget> children;
  final bool isExpanded;
  final ValueChanged<bool>? onExpansionChanged;
  final Duration animationDuration;

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<ExpansionTileWidget>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant ExpansionTileWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      _isExpanded = widget.isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      widget.onExpansionChanged?.call(_isExpanded);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: _handleTap,
          child: widget.title,
        ),
        ClipRect(
          child: Align(
            heightFactor: _isExpanded ? 1.0 : 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
            ),
          ),
        ),
      ],
    );
  }
}
