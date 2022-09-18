import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        hintText: 'Find Your Coffee...',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
