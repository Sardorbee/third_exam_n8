import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam/services/local/sqflite/db.dart';
import 'package:third_exam/ui/app_routes.dart';

void main() {
  runApp(const MyApp());
  DatabaseHelper.instance;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => const MaterialApp(
              themeMode: ThemeMode.system,
              debugShowCheckedModeBanner: false,
              initialRoute: RouteNames.tabscreen,
              onGenerateRoute: AppRoutes.generateRoute,
            ));
  }
}
