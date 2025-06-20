import 'package:flutter/material.dart';

class Money extends StatefulWidget {
  final double amount;
  final String imagePath;
  final double height;
  final double width;
  final bool isCoin;
  final Function(double) onPressed;
  final bool isEmpty;

  const Money({
    Key? key,
    required this.imagePath,
    required this.amount,
    required this.onPressed,
    this.height = 86,
    this.width = 130,
    this.isCoin = false,
    this.isEmpty = false,
  }) : super(key: key);

  @override
  State<Money> createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    widget.onPressed(widget.amount);
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
Widget build(BuildContext context) {
  double scale = _isPressed ? 1.15 : 1.0;

  return GestureDetector(
    onTapDown: widget.isEmpty ? null : _handleTapDown,
    onTapUp: widget.isEmpty ? null : _handleTapUp,
    onTapCancel: widget.isEmpty ? null : _handleTapCancel,
    child: AnimatedScale(
      scale: scale,
      duration: Duration(milliseconds: 500),
      child: ColorFiltered(
        colorFilter: widget.isEmpty
            ? const ColorFilter.matrix(<double>[
                0.2126, 0.7152, 0.0722, 0, 0,  // red
                0.2126, 0.7152, 0.0722, 0, 0,  // green
                0.2126, 0.7152, 0.0722, 0, 0,  // blue
                0, 0, 0, 1, 0,                // alpha
              ])
            : const ColorFilter.mode(Colors.transparent, BlendMode.multiply),
        child: ClipRRect(
          borderRadius: widget.isCoin
              ? BorderRadius.circular(widget.height / 2)
              : BorderRadius.zero,
          child: Image.asset(
            widget.imagePath,
            height: widget.height,
            width: widget.width,
            fit: BoxFit.fill,
          ),
        ),
      ),
    )
  );
  }
}