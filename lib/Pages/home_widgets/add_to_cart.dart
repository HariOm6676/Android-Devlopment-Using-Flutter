import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalogue.dart';
import '../../widgets/themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);


  // final _cart = CartModel();
  

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutations]);
    final CartModel _cart=(VxState.store as MyStore).cart;
    // final CatalogModel _catalog=(VxState.store as MyStore).catalog;
    bool isInCart = _cart.item.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // isInCart = isInCart.toggle();
        

           AddMutations(catalog);
          // _cart.catalog = _catalog;
          // _cart.add(catalog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueishColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
