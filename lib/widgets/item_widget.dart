import "package:flutter/material.dart";
import "package:test_app/models/catalogue.dart";

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      // color: Color.fromARGB(255, 248, 215, 215),
      child: ListTile(
        onTap: () {
          print("$item.name pressed");
        },
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        leading: Image.asset("assets/images/apple-iphone-12-r1.jpg"),
        title: Text(item.name),
        subtitle: Text("Apple iPhone 12th generation"),
        trailing: Text(
          "₹" + item.price.toString(),
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
