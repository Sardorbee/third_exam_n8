// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:third_exam/ui/utils/colorsapp.dart';

// class AppTheme {
//   static ThemeData darkTheme = ThemeData(
//     scaffoldBackgroundColor: AppColors.black,
//     appBarTheme: const AppBarTheme(
//       elevation: 0,
//       backgroundColor: AppColors.black,
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: AppColors.black,
//         statusBarBrightness: Brightness.light,
//         statusBarIconBrightness: Brightness.light,
//       ),
//     ),
//     textTheme: TextTheme(
//       //display
//       displayLarge: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 57.sp,
//           fontWeight: FontWeight.w800,
//           fontFamily: ""),
//       displayMedium: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 45.sp,
//           fontWeight: FontWeight.w700,
//           fontFamily: ""),
//       displaySmall: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 36.sp,
//           fontWeight: FontWeight.w600,
//           fontFamily: ""),
//       //headline
//       headlineLarge: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 32.sp,
//           fontWeight: FontWeight.w700,
//           fontFamily: ""),
//       headlineMedium: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 28.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       headlineSmall: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 24.sp,
//           fontWeight: FontWeight.w400,
//           fontFamily: ""),

//       //title
//       titleLarge: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 22.sp,
//           fontWeight: FontWeight.w700,
//           fontFamily: ""),
//       titleMedium: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//           fontFamily: ""),
//       titleSmall: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       //label
//       labelLarge: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w600,
//           fontFamily: ""),
//       labelMedium: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       labelSmall: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 11.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       //body
//       bodySmall: TextStyle(
//           color: AppColors.passivedarkTextColor,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       bodyMedium: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       bodyLarge: TextStyle(
//           color: AppColors.darktextColor,
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//     ),
//   );
//   ////////////////////////////////////////////////////////////////



//   ////////////////////////////////////////////////////////////////
//   static ThemeData lightTheme = ThemeData(
//     scaffoldBackgroundColor: AppColors.white,
//     appBarTheme: const AppBarTheme(
//       elevation: 0,
//       backgroundColor: AppColors.white,
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: AppColors.white,
//         statusBarBrightness: Brightness.dark,
//         statusBarIconBrightness: Brightness.dark,
//       ),
//     ),
//     textTheme: TextTheme(
//       //display
//       displayLarge: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 57.sp,
//           fontWeight: FontWeight.w800,
//           fontFamily: ""),
//       displayMedium: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 45.sp,
//           fontWeight: FontWeight.w700,
//           fontFamily: ""),
//       displaySmall: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 36.sp,
//           fontWeight: FontWeight.w600,
//           fontFamily: ""),
//       //headline
//       headlineLarge: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 32.sp,
//           fontWeight: FontWeight.w700,
//           fontFamily: ""),
//       headlineMedium: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 28.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       headlineSmall: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 24.sp,
//           fontWeight: FontWeight.w400,
//           fontFamily: ""),

//       //title
//       titleLarge: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 22.sp,
//           fontWeight: FontWeight.w700,
//           fontFamily: ""),
//       titleMedium: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//           fontFamily: ""),
//       titleSmall: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       //label
//       labelLarge: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w600,
//           fontFamily: ""),
//       labelMedium: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       labelSmall: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 11.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       //body
//       bodySmall: TextStyle(
//           color: AppColors.passivelightTextColor,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       bodyMedium: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//       bodyLarge: TextStyle(
//           color: AppColors.lighttextColor,
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w500,
//           fontFamily: ""),
//     ),
//   );
// }
