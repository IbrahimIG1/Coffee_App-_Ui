import 'package:coffee_app_ui/Lists/lists.dart';
import 'package:coffee_app_ui/screens/home/coffee_screen/coffee_screen.dart';
import 'package:coffee_app_ui/colors/colors.dart';
import 'package:coffee_app_ui/constant/constant.dart';
import 'package:coffee_app_ui/screens/favourite_screen/favourit_screen.dart';
import 'package:coffee_app_ui/shared/navigator.dart';
import 'package:coffee_app_ui/util/coffee_card.dart';
import 'package:coffee_app_ui/util/coffee_type.dart';
import 'package:coffee_app_ui/util/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  // User Select cofee type
  void typeSelect({required index}) {
    setState(() {
      for (int i = 0; i < coffee.length; i++) {
        coffee[i]['selected'] = false;
      }
      coffee[index]['selected'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        backgroundColor: buttonColor,
        
        body: SingleChildScrollView(
          child: Padding(
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
                    itemCount: coffee.length,
                    itemBuilder: (context, index) {
                      return CoffeeType(
                        onTap: () {
                          typeSelect(index: index);
                        },
                        coffeeType: coffee[index]['name'],
                        isSelect: coffee[index]['selected'],
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Container(
                  height: 250,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            navigateTo(
                                context,
                                CoffeeScreen(
                                  image: coffee[index]['image'],
                                  name: coffee[index]['name'],
                                  caption: coffee[index]['caption'],
                                  captionDetails: coffee[index]
                                      ['caption_details'],
                                  price: coffee[index]['price'],
                                  index: index,
                                ));
                          },
                          child: CoffeeCard(
                            image: coffee[index]['image'],
                            name: coffee[index]['name'],
                            caption: coffee[index]['caption'],
                            price: coffee[index]['price'],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                      itemCount: coffee.length),
                )
              ],
            ),
          ),
        ));
  }
}
