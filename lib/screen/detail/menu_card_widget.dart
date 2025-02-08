import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/style/colors/restaurant_color.dart';

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: RestaurantColor.primary.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 8,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              restaurant.image,
              width: 80,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text('Menu',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: RestaurantColor.white.color,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 4),
          Text('IDR 15.000',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black)),
        ],
      ),
    );
  }
}
