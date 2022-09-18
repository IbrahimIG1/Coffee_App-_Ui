import 'package:coffee_app_ui/Lists/lists.dart';
import 'package:coffee_app_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FavouritScreen extends StatefulWidget {
  @override
  State<FavouritScreen> createState() => _FavouritScreenState();
}

class _FavouritScreenState extends State<FavouritScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Stack(children: [
          Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                favCoffee[index]['image'],
                fit: BoxFit.cover,
                width: 500,
                height: 200,
              )),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.brown[600]!.withOpacity(.6),
                    borderRadius: BorderRadius.circular(20)),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: favItem(
                    context: context,
                    name: favCoffee[index]['name'],
                    caption: favCoffee[index]['caption'],
                    price: favCoffee[index]['price'].toString(),
                  ),
                ),
              ),
            ),
          ),
        ]);
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 20,
      ),
      itemCount: favCoffee.length,
    );
  }
}
