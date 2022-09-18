import 'package:coffee_app_ui/Lists/lists.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({
    super.key,
    required this.image,
    required this.name,
    required this.caption,
    required this.price,
  });
  final String image;
  final String name;
  final String caption;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          // color: Colors.white,
          gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.grey[800]!,
            Colors.grey[900]!,
            Colors.grey[900]!,
            Colors.black12,
            Colors.black,
          ]),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image(
                height: 150,
                width: 150,
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              caption,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: '\$',
                        children: [
                          TextSpan(
                              text: ' $price',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))
                        ],
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 15))),
                InkWell(
                  onTap: () {
                    print(coffee[0]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(Icons.add),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
