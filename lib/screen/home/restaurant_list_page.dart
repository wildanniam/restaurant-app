import 'package:flutter/material.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/screen/home/restaurant_card.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';
import 'package:restaurant_app/style/colors/restaurant_color.dart';
import 'package:provider/provider.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchListRestaurant();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RestaurantColor.white.color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Restaurant",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "Recommendation Restaurant For U",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.favorite_sharp, color: Colors.red),
                ],
              ),
              SizedBox(height: 12),

              // Search Bar
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search menu...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                ),
              ),
              SizedBox(height: 20),

              // Restaurant List
              Expanded(
                child: Consumer<RestaurantListProvider>(
                  builder: (context, provider, child) {
                    return switch (provider.resultState) {
                      RestaurantListLoadingState() => const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFFF89721),
                          ),
                        ),
                      RestaurantListLoadedState(data: var restaurantList) =>
                        ListView.builder(
                          itemCount: restaurantList.length,
                          itemBuilder: (context, index) {
                            final restaurant = restaurantList[index];
                            return RestaurantCard(
                              restaurant: restaurant,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  NavigationRoute.detailRoute.name,
                                  arguments: restaurant.id,
                                );
                              },
                            );
                          },
                        ),
                      RestaurantListErrorState(error: var message) => Center(
                          child: Text(message),
                        ),
                      _ => const SizedBox(),
                    };
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
