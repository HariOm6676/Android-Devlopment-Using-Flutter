import 'package:flutter/material.dart';
import 'package:test_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(children: [children:[
        placeholder().p32().expand(),
              Divider(),
              _CartTotal(),
      ]],)
      
      );
  }
}
class _CArtTotal
 extends StatelessWidget {
  const _CArtTotal
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}