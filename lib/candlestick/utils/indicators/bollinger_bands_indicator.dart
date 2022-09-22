import 'dart:math' as math;
import 'dart:ui';

import '../../models/indicator.dart';



class BollingerBandsIndicator extends Indicator {
  BollingerBandsIndicator({
    required int length,
    required int stdDev,
    required Color upperColor,
    required Color basisColor,
    required Color lowerColor,
  }) : super(
          name: "BB $length",
          dependsOnNPrevCandles: length,
          calculator: (index, candles) {
            double sum = 0;
            for (int i = index; i < index + length; i++) {
              sum += candles[i].close;
            }
            final average = sum / length;

            num sumOfSquaredDiffFromMean = 0;
            for (int i = index; i < index + length; i++) {
              final squareDiffFromMean =
                  math.pow(candles[i].close - average, 2);
              sumOfSquaredDiffFromMean += squareDiffFromMean;
            }

            final variance = sumOfSquaredDiffFromMean / length;

            final standardDeviation = math.sqrt(variance);

            return [
              average + standardDeviation * stdDev,
              average,
              average - standardDeviation * stdDev
            ];
          },
          indicatorComponentsStyles: [
            IndicatorStyle(name: "upper", color: upperColor),
            IndicatorStyle(name: "basis", color: basisColor),
            IndicatorStyle(name: "lower", color: lowerColor)
          ],
        );
}
