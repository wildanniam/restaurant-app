import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_list_response.dart';
import 'package:restaurant_app/screen/home/restaurant_card.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/style/colors/restaurant_color.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  late Future<RestaurantListResponse> _restaurantListRespon;
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _restaurantListRespon = ApiServices().getRestaurantList();
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
              Text(
                "Restaurant",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Row(
                children: [
                  Text(
                    "Recommendation Restaurant For U",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.favorite_sharp,
                    color: Colors.red,
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
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
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder(
                  future: _restaurantListRespon,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }

                        final listOfRestaurant = snapshot.data!.restaurants;
                        return ListView.builder(
                          itemCount: listOfRestaurant.length,
                          itemBuilder: (context, index) {
                            final restaurant = listOfRestaurant[index];

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
                        );
                      default:
                        return const SizedBox();
                    }
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
