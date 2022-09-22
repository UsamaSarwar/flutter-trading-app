import 'dart:ui';

class CandleSticksStyle {
  final Color borderColor;

  final Color background;

  final Color primaryBull;

  final Color secondaryBull;

  final Color primaryBear;

  final Color secondaryBear;

  final Color hoverIndicatorBackgroundColor;

  final Color mobileCandleHoverColor;

  final Color primaryTextColor;

  final Color secondaryTextColor;

  final Color loadingColor;

  final Color toolBarColor;

  CandleSticksStyle({
    required this.borderColor,
    required this.background,
    required this.primaryBull,
    required this.secondaryBull,
    required this.primaryBear,
    required this.secondaryBear,
    required this.hoverIndicatorBackgroundColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.mobileCandleHoverColor,
    required this.loadingColor,
    required this.toolBarColor,
  });

  factory CandleSticksStyle.dark({
    Color? borderColor,
    Color? background,
    Color? primaryBull,
    Color? secondaryBull,
    Color? primaryBear,
    Color? secondaryBear,
    Color? hoverIndicatorBackgroundColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? mobileCandleHoverColor,
    Color? loadingColor,
    Color? toolBarColor,
  }) {
    return CandleSticksStyle(
      borderColor: borderColor ?? const Color(0xFF848E9C),
      background: background ?? const Color(0xFF191B20),
      primaryBull: primaryBull ?? const Color(0xFF26A69A),
      secondaryBull: secondaryBull ?? const Color(0xFF005940),
      primaryBear: primaryBear ?? const Color(0xFFEF5350),
      secondaryBear: secondaryBear ?? const Color(0xFF82122B),
      hoverIndicatorBackgroundColor:
          hoverIndicatorBackgroundColor ?? const Color(0xFF4C525E),
      primaryTextColor: primaryTextColor ?? const Color(0xFF848E9C),
      secondaryTextColor: secondaryTextColor ?? const Color(0XFFFFFFFF),
      mobileCandleHoverColor:
          mobileCandleHoverColor ?? const Color(0xFFF0B90A).withOpacity(0.2),
      loadingColor: loadingColor ?? const Color(0xFFF0B90A),
      toolBarColor: toolBarColor ?? const Color(0xFF191B20),
    );
  }

  factory CandleSticksStyle.light({
    Color? borderColor,
    Color? background,
    Color? primaryBull,
    Color? secondaryBull,
    Color? primaryBear,
    Color? secondaryBear,
    Color? hoverIndicatorBackgroundColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? mobileCandleHoverColor,
    Color? loadingColor,
    Color? toolBarColor,
  }) {
    return CandleSticksStyle(
      borderColor: borderColor ?? const Color(0xFF848E9C),
      background: background ?? const Color(0xFFFAFAFA),
      primaryBull: primaryBull ?? const Color(0xEF26A69A),
      secondaryBull: secondaryBull ?? const Color(0xFF8CCCC6),
      primaryBear: primaryBear ?? const Color(0xFFEF5350),
      secondaryBear: secondaryBear ?? const Color(0xFFF1A3A1),
      hoverIndicatorBackgroundColor:
          hoverIndicatorBackgroundColor ?? const Color(0xFF131722),
      primaryTextColor: primaryTextColor ?? const Color(0XFF000000),
      secondaryTextColor: secondaryTextColor ?? const Color(0XFFFFFFFF),
      mobileCandleHoverColor:
          mobileCandleHoverColor ?? const Color(0xFFF0B90A).withOpacity(0.2),
      loadingColor: loadingColor ?? const Color(0xFFF0B90A),
      toolBarColor: toolBarColor ?? const Color(0xFFFAFAFA),
    );
  }
}
