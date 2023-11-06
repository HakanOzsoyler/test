import 'package:flutter/material.dart';

final class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.currency,
  });
  final String currency;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: Image.asset(
        'assets/ic_${currency}_currency_symbol.png',
        color: Colors.white,
      ),
    );
  }
}
