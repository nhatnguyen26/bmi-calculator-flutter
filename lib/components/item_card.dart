import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Color decorColor;
  final Widget cardChild;
  final Function onPressed;

  ItemCard({@required this.decorColor, this.cardChild, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: decorColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
