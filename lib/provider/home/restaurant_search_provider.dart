import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_search_response.dart';

enum SearchState { initial, loading, hasData, noData, error }

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiServices apiService;

  RestaurantSearchProvider({required this.apiService});

  late RestaurantSearchResponse _searchResult;
  SearchState _state = SearchState.initial;
  String _message = '';

  RestaurantSearchResponse get result => _searchResult;
  SearchState get state => _state;
  String get message => _message;

  Future<void> searchRestaurants(String query) async {
    try {
      _state = SearchState.loading;
      notifyListeners();

      final result = await apiService.searchRestaurant(query);

      if (result.restaurants.isEmpty) {
        _state = SearchState.noData;
        _message = 'No restaurants found';
      } else {
        _state = SearchState.hasData;
        _searchResult = result;
      }
    } catch (e) {
      _state = SearchState.error;
      _message = 'error occurred: $e';
    }
    notifyListeners();
  }
}
