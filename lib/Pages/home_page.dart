import "package:flutter/material.dart";
import "package:test_app/widgets/drawer.dart";

// ignore: camel_case_types
class home_page extends StatelessWidget {
  final int part = 1;
  final String name = "Hari Om Shukla";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome To $name Repositories part $part"),
        ),
      ),
      drawer: MyDraw(),
    );
  }
}
