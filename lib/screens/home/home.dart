import 'package:coffee_app_ui/Lists/lists.dart';
import 'package:coffee_app_ui/screens/home/coffee_screen/coffee_screen.dart';
import 'package:coffee_app_ui/colors/colors.dart';
import 'package:coffee_app_ui/constant/constant.dart';
import 'package:coffee_app_ui/screens/favourite_screen/favourit_screen.dart';
import 'package:coffee_app_ui/screens/home_screen/home_screen.dart';
import 'package:coffee_app_ui/shared/navigator.dart';
import 'package:coffee_app_ui/util/coffee_card.dart';
import 'package:coffee_app_ui/util/coffee_type.dart';
import 'package:coffee_app_ui/util/search_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // User Select cofee type
  void typeSelect({required index}) {
    setState(() {
      for (int i = 0; i < coffee.length; i++) {
        coffee[i]['selected'] = false;
      }
      coffee[index]['selected'] = true;
    });
  }

  int currentIndex = 0;

  List navList = [HomeScreen(), FavouritScreen(), Home()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.black54.withOpacity(.2),
            iconSize: 25,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: '',
              ),
            ]),
        backgroundColor: buttonColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu),
          actions: const [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/coffee-beans-wooden-small-bowls-old-wooden-vintage-background-closeup_1220-6683.jpg?w=1060&t=st=1663498225~exp=1663498825~hmac=5a2bffc8467d435ed07c3ab1afae05a949aef2ea2ad7f70617143d583bf93a85',
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: navList[currentIndex]);
  }
}
