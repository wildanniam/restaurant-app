import 'package:flutter/material.dart';

enum RestaurantColor {
  blue("Blue", Colors.blue),
  orange(
    "Orange",
    Color.fromARGB(
      255,
      248,
      151,
      33,
    ),
  );

  const RestaurantColor(this.name, this.color);

  final String name;
  final Color color;
}
