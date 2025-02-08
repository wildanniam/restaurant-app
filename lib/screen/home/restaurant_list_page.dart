import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/screen/home/restaurant_card.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/style/colors/restaurant_color.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final restaurants = Provider.of<RestaurantProvider>(context).restaurants;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Restaurant",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                "Recommendation Restaurant For U",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: restaurantList.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurantList[index];
                    return RestaurantCard(
                        restaurant: restaurant,
                        onTap: () => Navigator.pushNamed(
                            context, NavigationRoute.detailRoute.name,
                            arguments: restaurant));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
