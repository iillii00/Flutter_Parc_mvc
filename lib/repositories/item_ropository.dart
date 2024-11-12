import 'package:prac_mvc/models/item.dart';

class ItemRepository{

  Future<List<Item>> fetchItems() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Item(id: "1", name: "aa"),
      Item(id: "2", name: "bb"),
      Item(id: "3", name: "cc"),
    ];
  }

}