import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/screen/detail/menu_card_widget.dart';
import 'package:restaurant_app/style/colors/restaurant_color.dart';

class DetailRestaurant extends StatelessWidget {
  const DetailRestaurant({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            restaurant.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          foregroundColor: RestaurantColor.primary.color),
      backgroundColor: RestaurantColor.white.color,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              restaurant.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text(
                        restaurant.location,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin bibendum nunc ut magna tincidunt, et fermentum orci varius.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16),
                  Text('Menu',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.black)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MenuCardWidget(
                        restaurant: restaurant,
                      ),
                      MenuCardWidget(restaurant: restaurant),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
