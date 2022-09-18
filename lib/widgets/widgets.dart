import 'package:coffee_app_ui/colors/colors.dart';

import 'package:flutter/material.dart';

Widget buttonArrowBack({
  required IconData icon,
  required Function onTap,
}) =>
    InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 25,
            color: Colors.grey,
          ),
        ),
      ),
    );
Widget buttonIconFavorite({
  required IconData icon,
  required Function onTap,
  required bool selected,
}) =>
    InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 25,
            color: selected ? Colors.red : Colors.grey,
          ),
        ),
      ),
    );

Widget coffeeNameAndRate({
  required BuildContext context,
  required String name,
  required String caption,
  required String price,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: TextStyle(fontFamily: 'Aclonica',fontSize: 22)),
        SizedBox(
          height: 5,
        ),
        Text(
          caption,
          style: TextStyle(fontFamily: 'Aclonica',fontSize: 15,color: captionColor),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              price.toString(),
              style: TextStyle(fontFamily: 'Aclonica',fontSize: 15,color: captionColor)
            ),
          ],
        ),
      ],
    );

Widget favItem({
  required BuildContext context,
  required String name,
  required String caption,
  required String price,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontFamily: 'Aclonica',fontSize: 22)),
            SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: TextStyle(fontFamily: 'Aclonica',fontSize: 15,color: captionColor),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              price.toString(),
              style: TextStyle(fontFamily: 'Aclonica',fontSize: 15,color: captionColor),
            ),
          ],
        ),
      ],
    );

Widget buttonCoffeeMilk({
  required IconData icon,
}) =>
    Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[600]!),
          color: buttonColor,
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.orange,
          )),
    );

Widget textCaption({context, txt}) => Text(
      txt,
      style: Theme.of(context).textTheme.caption!.copyWith(
          fontSize: 18, color: captionColor, fontWeight: FontWeight.bold),
    );
Widget buttonCupSize(
        {required String size,
        required Function onTap,
        required bool selected}) =>
    InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(color: selected ? Colors.orange : Color(0xff)),
            color: Colors.blueGrey[900],
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          size,
          style: TextStyle(color: captionColor, fontSize: 20),
        )),
      ),
    );
