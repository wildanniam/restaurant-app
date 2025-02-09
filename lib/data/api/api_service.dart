import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/models/restaurant_detail_response.dart';
import 'package:restaurant_app/data/models/restaurant_list_response.dart';

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

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));
      if (response.statusCode == 200) {
        return RestaurantDetail.fromJson(jsonDecode(response.body));
      } else {
        return throw Exception('Failed to load Restaurant Detail');
      }
    } catch (e, stacktrace) {
      print("$e $stacktrace");
      return throw Exception(stacktrace);
    }
  }
}
