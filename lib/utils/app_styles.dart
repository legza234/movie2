import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppStyles {
  static TextStyle primaryBold20 = TextStyle(
      color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle primaryBold24 = TextStyle(
      color: AppColors.red, fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle whiteBold16 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white);
  static const TextStyle blackBold24 = TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.black);
  static const TextStyle blackBold16 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.black);
  static const TextStyle blackBold14 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.black);
}
