import 'package:prac_mvc/blocs/item_bloc.dart';
import 'package:prac_mvc/blocs/item_event.dart';

class ItemController{
  final ItemBloc itemBloc;

  ItemController(this.itemBloc);

  void loadItem(){
    itemBloc.add(FetchItems());
  }
}