// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:test_app/Pages/home_detail_page.dart';
import 'package:test_app/models/cart.dart';

import '../../models/catalogue.dart';
import '../../widgets/themes.dart';
import '../catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                catalog.name.text.uppercase.lg.black.extraBold.make(),
                catalog.desc.text.make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.mH8,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    _AddToCart(catalog:catalog),
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle();
          final _catalog=CatalogModel();
          final _cart= CartModel();
          _cart.catalog=_catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueishColor),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
        child: isAdded ? Icon(Icons.done) : "Add To Cart".text.make());
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catalog: catalog,
                    ),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}
