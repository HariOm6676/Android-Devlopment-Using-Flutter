import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Pages/home_page.dart';
import 'package:test_app/Pages/login_page.dart';
import 'package:test_app/utils/routes.dart';
import 'package:test_app/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: home_page(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => login_page(),
        MyRoutes.homeRoute: (context) => home_page(),
        MyRoutes.loginRoute: (context) => login_page(),
      },
    );
  }
}
