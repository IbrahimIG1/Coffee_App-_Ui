import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[600]!)),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Find Your Coffee...',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
