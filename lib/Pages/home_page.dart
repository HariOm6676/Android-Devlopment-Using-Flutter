import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "dart:convert";
import "package:test_app/models/catalogue.dart";
import "package:test_app/widgets/drawer.dart";
import "package:test_app/widgets/themes.dart";
import "../widgets/item_widget.dart";
// import "package:velocity_x/velocity_x.dart";

// ignore: camel_case_types
class home_page extends StatefulWidget {
  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final int part = 1;

  final String name = "Hari Om Shukla";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);

    var productsData = decodedData["products"];
    // print("HAri");
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 8, 243),
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.orange),
        title: Text("Catalogue App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      // color: Colors.black,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                        ),
                        child: Image.network(
                          item.image,
                        ),
                        footer: Container(
                          child: Text(
                            item.price.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                        ),
                      ));
                },
                itemCount: CatalogModel.items.length,
              )
            // ListView.builder(
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(
            //         item: CatalogModel.items[index],
            //       );
            //     },
            //   )

            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDraw(),
//       backgroundColor: Color.fromARGB(255, 205, 233, 244),
//       body: SafeArea(
//         child: Container(
//           padding: Vx.m32,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CatalogHeader(),
//               if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//                 CatalogList().expand()
//               else
//                 Center(
//                   child: CircularProgressIndicator(),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CatalogHeader extends StatelessWidget {
//   const CatalogHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         "Catalog App".text.xl5.bold.hexColor("#00008B").make(),
//         "Trending Products".text.xl2.make(),
//       ],
//     );
//   }
// }

// class CatalogList extends StatelessWidget {
//   const CatalogList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: CatalogModel.items.length,
//       itemBuilder: (context, index) {
//         final catalog = CatalogModel.items[index];
//         return CatalogItem(catalog: catalog);
//       },
//     );
//   }
// }

// class CatalogItem extends StatelessWidget {
//   final Item catalog;

//   const CatalogItem({super.key, required this.catalog});

//   @override
//   Widget build(BuildContext context) {
//     return VxBox(
//       child: Row(
//         children: [
//           CatalogImage(image: catalog.image),
//           Expanded(
//             child: Column(children: [
//               catalog.name.text.lg.color(MyTheme.darkBlueishColor).bold.make(),
//               catalog.desc.text.make(),
//               ButtonBar(
//                 alignment: MainAxisAlignment.spaceBetween,
//                 buttonPadding: Vx.mH8,
//                 children: [
//                   "\$${catalog.price}".text.bold.xl.make(),
//                   ElevatedButton(
//                       onPressed: () {},
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(MyTheme.darkBlueishColor),
//                         shape: MaterialStateProperty.all(StadiumBorder()),
//                       ),
//                       child: "Buy".text.make()),
//                 ],
//               )
//             ]),
//           )
//         ],
//       ),
//     ).white.rounded.square(150).make().py16();
//   }
// }

// class CatalogImage extends StatelessWidget {
//   final String image;

//   const CatalogImage({super.key, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(image)
//         .box
//         .rounded
//         .p8
//         .color(MyTheme.creamColor)
//         .make()
//         .w40(context);
//   }
    );
  }
}
