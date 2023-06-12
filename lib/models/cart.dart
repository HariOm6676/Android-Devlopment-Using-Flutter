import 'package:test_app/models/catalogue.dart';

class CartModel{
  static final cartModel=CartModel._internal();
  CartModel._internal();
  factory CartModel()=>cartModel;
  late CatalogModel _catalog;
  final List<int> _itemIds=[];
  CatalogModel get catalog=> _catalog;
  set catalog(CatalogModel newcatalog){
_catalog=newcatalog;
  }
  List<Item> get item => _itemIds.map((id)=> _catalog.getById(id)).toList();
  num get totalPrice => item.fold(0, (previousValue, element) => previousValue+element.price);
  void add(Item item){
    _itemIds.add(item.id);
  }
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}