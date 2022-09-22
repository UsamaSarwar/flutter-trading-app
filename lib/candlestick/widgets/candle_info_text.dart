import 'package:flutter/material.dart';

import '.././models/candle.dart';
import '.././utils/helper_functions.dart';

class CandleInfoText extends StatelessWidget {
  final Candle candle;

  final Color bullColor;
  final Color bearColor;
  final TextStyle defaultStyle;
  const CandleInfoText({
    Key? key,
    required this.candle,
    required this.bullColor,
    required this.bearColor,
    required this.defaultStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: dateFormatter(candle.date),
        style: defaultStyle,
        children: <TextSpan>[
          const TextSpan(text: " O:"),
          TextSpan(
            text: HelperFunctions.priceToString(candle.open),
            style: TextStyle(
              color: candle.isBull ? bullColor : bearColor,
            ),
          ),
          const TextSpan(text: " H:"),
          TextSpan(
            text: HelperFunctions.priceToString(candle.high),
            style: TextStyle(
              color: candle.isBull ? bullColor : bearColor,
            ),
          ),
          const TextSpan(text: " L:"),
          TextSpan(
            text: HelperFunctions.priceToString(candle.low),
            style: TextStyle(
              color: candle.isBull ? bullColor : bearColor,
            ),
          ),
          const TextSpan(text: " C:"),
          TextSpan(
            text: HelperFunctions.priceToString(candle.close),
            style: TextStyle(
              color: candle.isBull ? bullColor : bearColor,
            ),
          ),
        ],
      ),
    );
  }

  String dateFormatter(DateTime date) {
    return "${date.year}-${numberFormat(date.month)}-${numberFormat(date.day)} ${numberFormat(date.hour)}:${numberFormat(date.minute)}";
  }

  String numberFormat(int value) {
    return "${value < 10 ? 0 : ""}$value";
  }
}
