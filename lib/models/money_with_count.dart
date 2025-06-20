import 'package:flutter/material.dart';
import 'money.dart';

class MoneyWithCount extends StatelessWidget {
  final String imagePath;
  final double amount;
  final bool isCoin;
  final double height;
  final double width;
  final Function(double) onPressed;
  final int count;

  const MoneyWithCount({
    Key? key,
    required this.imagePath,
    required this.amount,
    this.isCoin = false,
    required this.height,
    required this.width,
    required this.onPressed,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Money(
          imagePath: imagePath,
          amount: amount,
          isCoin: isCoin,
          height: height,
          width: width,
          onPressed: onPressed,
          isEmpty: count == 0,
        ),
        if (count >= 0)
        Positioned(
          right: isCoin ? 4 : 4,
          left: isCoin ? null : null,
          top: isCoin ? -30 : -8,
          child: IgnorePointer(
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: count > 5
                    ? Colors.blue
                    : (count > 0 ? Colors.yellow : Colors.red),
                shape: BoxShape.circle,
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isCoin ? 20 : 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
