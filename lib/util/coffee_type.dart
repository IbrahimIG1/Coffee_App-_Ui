import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  CoffeeType(
      {required this.coffeeType, required this.isSelect, required this.onTap});
  final String coffeeType;
  final bool isSelect;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Column(
          children: [
            Text(
              "${coffeeType}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelect ? Colors.orange : Colors.white,
                fontSize: 18,
              ),
            ),
            if (isSelect)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  width: 8,
                  height: 8,
                ),
              )
            // Text(
            //   '.',
            //   style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.orange),
            // )
          ],
        ),
      ),
    );
  }
}
