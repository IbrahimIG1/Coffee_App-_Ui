import 'package:coffee_app_ui/Lists/lists.dart';
import 'package:coffee_app_ui/colors/colors.dart';
import 'package:coffee_app_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CoffeeScreen extends StatefulWidget {
  CoffeeScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.caption,
      required this.price,
      required this.captionDetails});
  final String image;
  final String name;
  final String caption;
  final String captionDetails;
  final double price;

  @override
  State<CoffeeScreen> createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  bool isSelected = false;
  void changeButtonSize(int index) {
    setState(() {
      for (int i = 0; i < coffeeSize.length; i++) {
        coffeeSize[i]['selected'] = false;
      }
      coffeeSize[index]['selected'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: buttonColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                    width: 500,
                    height: 450,
                  )),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: buttonIconFavorite(
                            icon: Icons.arrow_back_ios,
                          ),
                        ),
                        buttonIconFavorite(
                          icon: Icons.favorite,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown[600]!.withOpacity(.6),
                        borderRadius: BorderRadius.circular(20)),
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            coffeeNameAndRate(
                                context: context,
                                name: widget.name,
                                caption: widget.caption,
                                price: widget.price.toString()),
                            Column(children: [
                              Row(
                                children: [
                                  buttonCoffeeMilk(icon: Icons.coffee_outlined),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  buttonCoffeeMilk(
                                      icon: Icons.water_drop_rounded),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey[600]!),
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  'Mediam Roasted',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(fontSize: 13),
                                ),
                              )
                            ]),
                          ]),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textCaption(context: context, txt: 'Description'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.captionDetails,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18, color: Colors.grey[300], height: 1.5),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textCaption(context: context, txt: 'Size'),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 20),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buttonCupSize(
                            selected: coffeeSize[index]['selected'],
                            onTap: () {
                              changeButtonSize(index);
                            },
                            size: coffeeSize[index]['size']);
                      },
                      itemCount: coffeeSize.length,
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     buttonCupSize(
                  //         size: 'S', onTap: () {}, color: Colors.orange),
                  //     SizedBox(
                  //       width: 15,
                  //     ),
                  //     buttonCupSize(
                  //         size: 'M', onTap: () {}, color: Color(0xff)),
                  //     SizedBox(
                  //       width: 15,
                  //     ),
                  //     buttonCupSize(
                  //       size: 'L',
                  //       onTap: () {},
                  //       color: Color(0xff),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                                color: captionColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$ ${widget.price.toString()}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            height: 60,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: MaterialButton(
                              color: Colors.orange,
                              onPressed: () {},
                              child: Text(
                                'Buy Now',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
