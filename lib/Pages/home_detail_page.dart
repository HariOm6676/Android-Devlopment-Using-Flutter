import "package:flutter/material.dart";
import 'package:test_app/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

import '../models/catalogue.dart';
class HomeDetailPage extends StatelessWidget {
 final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent, 
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color:context.cardColor,
        child: ButtonBar(
           alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.mH8,
                  children: [
                    "\$${catalog.price}".text.bold.xl4.red800.make(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.darkBlueishColor),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                        child: "Add To Cart".text.make()).wh(120,50),
                  ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image),
            ).h32(context),
            Expanded(child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                     catalog.name.text.xl4.color(MyTheme.darkBlueishColor).bold.make(),
              catalog.desc.text.xl.make(),10.heightBox,
              "Sanctus voluptua et clita ut no sanctus amet dolore consetetur, gubergren stet eos eos sed no at amet lorem. At et lorem eos diam nonumy sit, clita nonumy rebum kasd sadipscing dolor. Vero magna et aliquyam accusam sed sanctus. Consetetur clita et stet sed. Est dolore sanctus sed duo. Et."
              .text.caption(context)
              .make()
              .p16(),
                  ],
                ).py64(),
              ),
            ))
      
        ],
        ),
      ),
    );
  }
}