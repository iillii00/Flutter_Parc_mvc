import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac_mvc/blocs/item_event.dart';
import 'package:prac_mvc/blocs/item_state.dart';
import 'package:prac_mvc/models/item.dart';
import 'package:prac_mvc/repositories/item_ropository.dart';


class ItemBloc extends Bloc<ItemEvent, ItemState> {

  final ItemRepository itemRepository;

  ItemBloc(this.itemRepository) : super(ItemInitial()) {

    on<FetchItems>((event, emit) async {
      final state = this.state;

      emit(ItemLoading());

      if(state is ItemLoaded){
        try{
          final items = await itemRepository.fetchItems();
          List<Item> currentItems = List.from(state.items);
          currentItems.addAll(items);
          emit(ItemLoaded(currentItems));
        }catch(e){
          print(e);
      }
      }

    });

  }
}
