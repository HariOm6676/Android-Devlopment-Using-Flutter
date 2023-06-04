import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "dart:convert";
import "package:test_app/models/catalogue.dart";
import "package:test_app/widgets/drawer.dart";

import "../widgets/item_widget.dart";

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
    var catalogjson = await rootBundle.loadString("assets/file/catalog.json");
    var decodedData = jsonDecode(catalogjson);
    var productsData=decodedData["products"];
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 8, 243),
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.orange),
        title: Text("Catalogue App"),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: dummyList[index],
          );
        },
      ),
      drawer: MyDraw(),
    );
  }
}
