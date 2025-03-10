import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/models/restaurant_detail_response.dart';
import 'package:restaurant_app/data/models/restaurant_list_response.dart';
import 'package:restaurant_app/data/models/restaurant_search_response.dart';

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantListResponse> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tourism list');
    }
  }

  Future<RestaurantSearchResponse> searchRestaurant(String query) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/search?q=$query"));

      if (response.statusCode == 200) {
        return RestaurantSearchResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed to search restaurants: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error searching restaurants: $e');
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));
      if (response.statusCode == 200) {
        return RestaurantDetail.fromJson(jsonDecode(response.body));
      } else {
        return throw Exception('Failed to load Restaurant Detail');
      }
    } catch (e, stacktrace) {
      return throw Exception(stacktrace);
    }
  }

  Future<void> submitReview(
      String restaurantId, String name, String review) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/review"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": restaurantId,
        "name": name,
        "review": review,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to add review");
    }
  }
}
