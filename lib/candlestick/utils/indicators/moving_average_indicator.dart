import 'dart:ui';

import '../../models/indicator.dart';

class MovingAverageIndicator extends Indicator {
  MovingAverageIndicator({
    required int length,
    required Color color,
  }) : super(
          name: "MA $length",
          dependsOnNPrevCandles: length,
          calculator: (index, candles) {
            double sum = 0;
            for (int i = 0; i < length; i++) {
              sum += candles[i + index].close;
            }
            return [sum / length];
          },
          indicatorComponentsStyles: [
            IndicatorStyle(name: "mv", color: color),
          ],
        );
}
