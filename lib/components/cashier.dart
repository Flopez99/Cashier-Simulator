import 'package:flutter/material.dart';
import 'package:cashier_simulator/models/money_with_count.dart';

class Cashier extends StatefulWidget {
  final double changeAmount;
  final double counterAmount;
  final Function(double) handleMoneyPress;
  final Function() onRestartPressed;

  Cashier({
    required this.changeAmount,
    required this.counterAmount,
    required this.handleMoneyPress,
    required this.onRestartPressed,
  });

  @override
  _CashierState createState() => _CashierState();
}

class _CashierState extends State<Cashier> {
  late Map<double, int> moneyQuantities;

  @override
  void initState() {
    super.initState();
    moneyQuantities = {
      1.0: 10,
      5.0: 10,
      10.0: 10,
      20.0: 10,
      50.0: 10,
      100.0: 10,
      0.01: 10,
      0.05: 10,
      0.10: 10,
      0.25: 10,
    };
  }

  void handleMoneyPress(double amount) {
    if (moneyQuantities[amount]! > 0) {
      setState(() {
        moneyQuantities[amount] = moneyQuantities[amount]! - 1;
      });
      widget.handleMoneyPress(amount);
    }
  }

  void onRestartPressed() {
    setState(() {
      moneyQuantities.updateAll((key, value) => 5);

    });
    widget.onRestartPressed();
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Set sizes based on screen width (can be further tuned)
    double billHeight = screenWidth * 0.25;
    double billWidth = screenWidth * 0.40;

    double coinSmall = screenWidth * 0.14;   // was 0.11
    double coinMedium = screenWidth * 0.16;  // was 0.15
    double coinLarge = screenWidth * 0.20;   // was 0.23
    double xLarge = screenWidth * 0.22;   // was 0.23

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                MoneyWithCount(
                  imagePath: 'assets/money/bills/dollar1.jpg',
                  amount: 1.0,
                  height: billHeight,
                  width: billWidth,
                  onPressed: handleMoneyPress,
                  count: moneyQuantities[1.0]!,
                ),
                MoneyWithCount(
                  imagePath: 'assets/money/bills/dollar5.jpg',
                  amount: 5.0,
                  height: billHeight,
                  width: billWidth,
                  onPressed: handleMoneyPress,
                  count: moneyQuantities[5.0]!,
                  
                ),
                MoneyWithCount(
                  imagePath: 'assets/money/bills/dollar10.jpg',
                  amount: 10.0,
                  height: billHeight,
                  width: billWidth,
                  onPressed: handleMoneyPress,
                  count: moneyQuantities[10.0]!,
                ),
                MoneyWithCount(
                  imagePath: 'assets/money/bills/dollar20.jpg',
                  amount: 20.0,
                  height: billHeight,
                  width: billWidth,
                  onPressed: handleMoneyPress,
                  count: moneyQuantities[20.0]!,
                ),
                MoneyWithCount(
                  imagePath: 'assets/money/bills/dollar50.jpg',
                  amount: 50.0,
                  height: billHeight,
                  width: billWidth,
                  onPressed: handleMoneyPress,
                  count: moneyQuantities[50.0]!,
                ),
                MoneyWithCount(
                  imagePath: 'assets/money/bills/dollar100.jpg',
                  amount: 100.0,
                  height: billHeight,
                  width: billWidth,
                  onPressed: handleMoneyPress,
                  count: moneyQuantities[100.0]!,
                ),
              ],
            ),
            const SizedBox(height: 27),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MoneyWithCount(
                    imagePath: 'assets/money/coins/coin1.jpg',
                    amount: 0.01,
                    isCoin: true,
                    height: coinSmall,
                    width: coinSmall,
                    onPressed: handleMoneyPress,
                    count: moneyQuantities[.01]!,
                  ),
                  const SizedBox(width: 16),
                  MoneyWithCount(
                    imagePath: 'assets/money/coins/coin5.jpg',
                    amount: 0.05,
                    isCoin: true,
                    height: coinLarge,
                    width: coinLarge,
                    onPressed: handleMoneyPress,
                    count: moneyQuantities[.05]!,
                  ),
                  const SizedBox(width: 16),
                  MoneyWithCount(
                    imagePath: 'assets/money/coins/coin10.jpg',
                    amount: 0.10,
                    isCoin: true,
                    height: coinMedium,
                    width: coinMedium,
                    onPressed: handleMoneyPress,
                    count: moneyQuantities[.10]!,
                  ),
                  const SizedBox(width: 16),
                  MoneyWithCount(
                    imagePath: 'assets/money/coins/coin25.jpg',
                    amount: 0.25,
                    isCoin: true,
                    height: xLarge,
                    width: xLarge,
                    onPressed: handleMoneyPress,
                    count: moneyQuantities[.25]!,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
