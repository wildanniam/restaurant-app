import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/screen/detail/body_of_detail_screen_widget.dart';
import 'package:restaurant_app/static/restaurant_detail_result_state.dart';
import 'package:restaurant_app/style/colors/restaurant_color.dart';

class DetailRestaurant extends StatefulWidget {
  const DetailRestaurant({super.key, required this.restaurantID});
  final String restaurantID;

  @override
  State<DetailRestaurant> createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurant> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<RestaurantDetailProvider>()
          .fetchDetailRestaurant(widget.restaurantID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Restaurant",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        foregroundColor: RestaurantColor.primary.color,
      ),
      backgroundColor: RestaurantColor.white.color,
      body: Consumer<RestaurantDetailProvider>(
        builder: (context, provider, child) {
          final state = provider.resultState;

          if (state is RestaurantDetailLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RestaurantDetailLoadedState) {
            final restaurantData = state.data;
            return BodyOfDetailScreenWidget(restaurant: restaurantData);
          } else if (state is RestaurantDetailErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
