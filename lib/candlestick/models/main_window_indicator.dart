import 'dart:math' as math;

import 'package:flutter/material.dart';

import '.././models/indicator.dart';
import 'candle.dart';

class IndicatorComponentData {
  final String name;
  final Color color;
  final List<double?> values = [];
  final Indicator parentIndicator;
  bool visible = true;
  IndicatorComponentData(this.parentIndicator, this.name, this.color);
}

class MainWindowDataContainer {
  List<IndicatorComponentData> indicatorComponentData = [];
  List<Indicator> indicators;
  List<double> highs = [];
  List<double> lows = [];
  List<String> unvisibleIndicators = [];
  late DateTime beginDate;
  late DateTime endDate;

  MainWindowDataContainer(this.indicators, List<Candle> candles) {
    endDate = candles[0].date;
    beginDate = candles.last.date;
    for (var indicator in indicators) {
      for (var indicatorComponent in indicator.indicatorComponentsStyles) {
        indicatorComponentData.add(IndicatorComponentData(
            indicator, indicatorComponent.name, indicatorComponent.color));
      }
    }

    highs = candles.map((e) => e.high).toList();
    lows = candles.map((e) => e.low).toList();

    for (var indicator in indicators) {
      final List<IndicatorComponentData> containers = indicatorComponentData
          .where((element) => element.parentIndicator == indicator)
          .toList();

      for (int i = 0; i < candles.length; i++) {
        double low = lows[i];
        double high = highs[i];

        List<double?> indicatorDatas = List.generate(
            indicator.indicatorComponentsStyles.length, (index) => null);

        if (i + indicator.dependsOnNPrevCandles < candles.length) {
          indicatorDatas = indicator.calculator(i, candles);
        }

        for (int i = 0; i < indicatorDatas.length; i++) {
          containers[i].values.add(indicatorDatas[i]);
          if (indicatorDatas[i] != null) {
            low = math.min(low, indicatorDatas[i]!);
            high = math.max(high, indicatorDatas[i]!);
          }
        }
        lows[i] = low;
        highs[i] = high;
      }
    }
  }

  void tickUpdate(List<Candle> candles) {
    // update last candles
    for (int i = 0; candles[i].date.compareTo(endDate) > 0; i++) {
      highs.insert(i, candles[i].high);
      lows.insert(i, candles[i].low);
      for (var element in indicatorComponentData) {
        element.values.insert(i, null);
      }
    }
    for (var indicator in indicators) {
      final List<IndicatorComponentData> containers = indicatorComponentData
          .where((element) => element.parentIndicator == indicator)
          .toList();

      for (int i = 0; candles[i].date.compareTo(endDate) >= 0; i++) {
        double low = lows[i];
        double high = highs[i];

        List<double?> indicatorDatas = List.generate(
            indicator.indicatorComponentsStyles.length, (index) => null);

        if (i + indicator.dependsOnNPrevCandles < candles.length) {
          indicatorDatas = indicator.calculator(i, candles);
        }

        for (int j = 0; j < indicatorDatas.length; j++) {
          containers[j].values[i] = indicatorDatas[j];
          if (indicatorDatas[j] != null) {
            low = math.min(low, indicatorDatas[j]!);
            high = math.max(high, indicatorDatas[j]!);
          }
        }
        lows[i] = low;
        highs[i] = high;
      }
    }
    endDate = candles[0].date;

    // update prev candles
    int firstCandleIndex = 0;
    for (int i = candles.length - 1; i >= 0; i--) {
      if (candles[i].date == beginDate) {
        firstCandleIndex = i;
        break;
      }
    }
    for (int i = firstCandleIndex + 1; i < candles.length; i++) {
      highs.add(candles[i].high);
      lows.add(candles[i].low);
      for (var element in indicatorComponentData) {
        element.values.add(null);
      }
    }
    for (var indicator in indicators) {
      final List<IndicatorComponentData> containers = indicatorComponentData
          .where((element) => element.parentIndicator == indicator)
          .toList();

      for (int i = firstCandleIndex - indicator.dependsOnNPrevCandles + 1;
          i < candles.length;
          i++) {
        double low = lows[i];
        double high = highs[i];

        List<double?> indicatorDatas = List.generate(
            indicator.indicatorComponentsStyles.length, (index) => null);

        if (i + indicator.dependsOnNPrevCandles < candles.length) {
          indicatorDatas = indicator.calculator(i, candles);
        }

        for (int j = 0; j < indicatorDatas.length; j++) {
          containers[j].values[i] = indicatorDatas[j];
          if (indicatorDatas[j] != null) {
            low = math.min(low, indicatorDatas[j]!);
            high = math.max(high, indicatorDatas[j]!);
          }
        }
        lows[i] = low;
        highs[i] = high;
      }
    }
    beginDate = candles.last.date;
  }

  void toggleIndicatorVisibility(String indicatorName) {
    if (unvisibleIndicators.contains(indicatorName)) {
      unvisibleIndicators.remove(indicatorName);
      for (var element in indicatorComponentData) {
        if (element.parentIndicator.name == indicatorName) {
          element.visible = true;
        }
      }
    } else {
      unvisibleIndicators.add(indicatorName);
      for (var element in indicatorComponentData) {
        if (element.parentIndicator.name == indicatorName) {
          element.visible = false;
        }
      }
    }
  }
}
