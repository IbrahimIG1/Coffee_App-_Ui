import 'package:coffee_app_ui/util/coffee_type.dart';
import 'package:coffee_app_ui/util/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List coffeeList = [
    [
      'Cappuccino',
      true,
    ],
    [
      'Espresso',
      false,
    ],
    [
      'Dark',
      false,
    ],
    [
      'Late',
      false,
    ],
    [
      'Bondock',
      false,
    ],
  ];

  // User Select cofee type
  void typeSelect({required index}) {
    setState(() {
      for (int i = 0; i < coffeeList.length; i++) {
        coffeeList[i][1] = false;
      }
      coffeeList[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff171413),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find the best \ncoffee for you',
                style: GoogleFonts.bebasNeue(fontSize: 40),
              ),
              SizedBox(
                height: 40,
              ),
              SearchBar(),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 60,
                child: ListView.builder(
                  itemCount: coffeeList.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                      onTap: () {
                        typeSelect(index: index);
                      },
                      coffeeType: coffeeList[index][0],
                      isSelect: coffeeList[index][1],
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ),
        ));
  }
}
