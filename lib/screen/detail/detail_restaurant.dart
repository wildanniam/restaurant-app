import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_detail_response.dart';
import 'package:restaurant_app/screen/detail/body_of_detail_screen_widget.dart';
import 'package:restaurant_app/style/colors/restaurant_color.dart';

class DetailRestaurant extends StatefulWidget {
  const DetailRestaurant({super.key, required this.restaurantID});
  final String restaurantID;

  @override
  State<DetailRestaurant> createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurant> {
  late Future<RestaurantDetail> _futureRestaurantDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureRestaurantDetail =
        ApiServices().getRestaurantDetail(widget.restaurantID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Restaurant",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          foregroundColor: RestaurantColor.primary.color),
      backgroundColor: RestaurantColor.white.color,
      body: FutureBuilder(
        future: _futureRestaurantDetail,
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
              final restaurantData = snapshot.data!.restaurant;
              return BodyOfDetailScreenWidget(restaurant: restaurantData);
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
