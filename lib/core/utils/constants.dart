import 'package:flutter/material.dart';

abstract class KConstants {
  static const String APP_NAME = "Occasio";
  static const String PAGE_NOT_FOUND = "Page not found";

  static const String LOREM =
      "Sed elementum tempus egestas sed. Ridiculus mus mauris vitae ultricies leo integer malesuada nunc.";
}

abstract class KTextStyles {
  // Text Styles
  static const TextStyle titleStyle = TextStyle(
      fontSize: 32.0, fontWeight: FontWeight.w600, letterSpacing: 1.0);
  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
}

// Draft Screen Size

const double draftScreenWidth = 390;
const double draftScreenHeigt = 690;

/// Dimensions
const double kSpacingNone = 0.0;
const double kSpacingX2 = 2.0;
const double kSpacingX4 = 4.0;
const double kSpacingX8 = 8.0;
const double kSpacingX12 = 12.0;
const double kSpacingX16 = 16.0;
const double kSpacingX20 = 20.0;
const double kSpacingX24 = 24.0;
const double kSpacingX36 = 36.0;
const double kSpacingX42 = 42.0;
const double kSpacingX48 = 48.0;
const double kSpacingX56 = 56.0;
const double kSpacingX64 = 64.0;
const double kSpacingX72 = 72.0;
const double kSpacingX84 = 84.0;
const double kSpacingX96 = 96.0;
const double kSpacingX100 = 100.0;
const double kSpacingX120 = 120.0;
const double kSpacingX160 = 160.0;
const double kSpacingX200 = 200.0;
const double kSpacingX230 = 230.0;
const double kSpacingX250 = 250.0;
const double kSpacingX300 = 300.0;
const double kSpacingX320 = 320.0;
const double kSpacingX360 = 360.0;
const double kOpacityX14 = 0.14;
const double kOpacityX35 = 0.35;
const double kOpacityX50 = 0.5;
const double kOpacityX70 = 0.7;
const double kOpacityX90 = 0.9;
const double kEmphasisLow = 0.38;
const double kEmphasisMedium = 0.67;
const double kEmphasisHigh = 0.9;

/// Colors
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;
const kTransparent = Colors.transparent;
const kDisabledColor = Color(0xFF666666);
const kDisabledColorDark = Color(0xFFE4E4E4);

const kPrimaryColor = Color(0xFF98DE00);
const kSecondaryLightColor = Color(0xFF98DE00);
const kErrorLightColor = Color(0xffE91E63);
const kAccentLightColor = kSecondaryLightColor;
const kBackgroundLightColor = kWhiteColor;
const kCardLightColor = kWhiteColor;

const kPrimaryColorDark = Color(0xFFEA6300);
const kSecondaryDarkColor = Color(0xFFEA6300);
const kErrorDarkColor = Color(0xffEC407A);
const kAccentDarkColor = kWhiteColor;
const kBackgroundDarkColor = Color(0xFF253238);
// const kBackgroundDarkColor = Color(0xFF17212D);
const kCardDarkColor = Color(0xFF272727);
const kSurfaceDarkColor = Color(0xFF222225);

/// Icon Colors
const kAccentIconLightColor = kPrimaryColor;
const kPrimaryIconLightColor = kBlackColor;

const kAccentIconDarkColor = kPrimaryColorDark;
const kPrimaryIconDarkColor = kPrimaryColorDark;

/// Text Colors
const kBodyTextColorLight = Color(0xFF232323);
const kTitleTextColorLight = Color(0xFF131313);
const kUnselectedLabelColorLight = Color(0xFF7C7C7C);

const kBodyTextColorDark = Colors.white;
const kUnselectedLabelColorDark = Color(0xFFDEDEDE);
const kTitleTextColorDark = Color(0xFFDEDEDE);

const kShadowColor = Color(0xFFDEDEDE);
const kShadowDarkColor = Color(0xFF7C7C7C);

// Backgroud Gradients
//
const LinearGradient kBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(3, 3),
    colors: [Color(0xFF2f3591), Colors.white]);

// Text Style
//
TextStyle kInfoTextSytle() {
  return TextStyle(
    color: kWhiteColor,
    fontSize: kSpacingX12,
    fontFamily: "poppins",
  );
}

TextStyle kHeadingTextStyle() {
  return TextStyle(
    fontSize: kSpacingX24,
    color: kWhiteColor,
    fontFamily: "Poppins",
  );
}
