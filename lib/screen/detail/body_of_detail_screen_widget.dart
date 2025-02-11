import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/detail/menu_card_widget.dart';
import 'package:restaurant_app/screen/detail/review_card_widget.dart';
import 'package:restaurant_app/style/colors/restaurant_color.dart';

import '../../data/models/restaurant_detail_response.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  const BodyOfDetailScreenWidget({super.key, required this.restaurant});
  final RestaurantDetailResponse restaurant;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                  "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
                  width: double.infinity,
                  // height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  restaurant.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                _ratingRestaurant(context, restaurant),
              ],
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
                  "${restaurant.address}, ${restaurant.city}",
                  style: TextStyle(
                    fontSize: 16,
                    color: RestaurantColor.black.color,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(height: 16),
            Text(
                "${restaurant.categories[0].name}, ${restaurant.categories[1].name}",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.black)),
            SizedBox(height: 10),
            Text(
              restaurant.description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16),
            Text('Menu',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.black)),
            SizedBox(height: 20),
            _menuMakanan(),
            SizedBox(
              height: 25,
            ),
            _menuMinuman(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Customer Reviews',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.black)),
                _ratingRestaurant(context, restaurant),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurant.customerReviews.length,
                itemBuilder: (context, index) {
                  final review = restaurant.customerReviews[index];
                  return ReviewCardWidget(
                    name: review.name,
                    review: review.review,
                    date: review.date,
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _menuMinuman() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurant.menus.drinks.length,
        itemBuilder: (context, index) {
          final menu = restaurant.menus.drinks[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MenuCardWidget(
              namaMenu: menu.name,
              restaurant: restaurant,
              isFood: false,
            ),
          );
        },
      ),
    );
  }

  SizedBox _menuMakanan() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurant.menus.foods.length,
        itemBuilder: (context, index) {
          final menu = restaurant.menus.foods[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MenuCardWidget(
              namaMenu: menu.name,
              restaurant: restaurant,
              isFood: true,
            ),
          );
        },
      ),
    );
  }
}

Row _ratingRestaurant(
    BuildContext context, RestaurantDetailResponse restaurant) {
  return Row(
    children: [
      const Icon(Icons.star, color: Colors.amber, size: 24),
      SizedBox(width: 4),
      Text(restaurant.rating.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold)),
    ],
  );
}
