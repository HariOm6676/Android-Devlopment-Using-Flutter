import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Pages/cart_page.dart';
import 'package:test_app/Pages/home_page.dart';
import 'package:test_app/Pages/login_page.dart';
import 'package:test_app/core/store.dart';
import 'package:test_app/models/cart.dart';
import 'package:test_app/models/catalogue.dart';
import 'package:test_app/utils/routes.dart';

import 'package:test_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
      store: MyStore(CatalogModel(), CartModel()), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: home_page(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => login_page(),
        MyRoutes.homeRoute: (context) => home_page(),
        MyRoutes.loginRoute: (context) => login_page(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
