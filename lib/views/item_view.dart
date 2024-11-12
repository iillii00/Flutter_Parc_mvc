// lib/views/item_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac_mvc/blocs/item_state.dart';
import 'package:prac_mvc/controllers/item_countroller.dart';
import '../blocs/item_bloc.dart';

class ItemView extends StatelessWidget {
  final ItemController controller;

  ItemView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ItemLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return ListTile(title: Text(item.name));
              },
            );
          } else if (state is ItemError) {
            return Center(child: Text('Failed to load items'));
          }
          return Center(child: Text('Press the button to load items'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.loadItem,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
