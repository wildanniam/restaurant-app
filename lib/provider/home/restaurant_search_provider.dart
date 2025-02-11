import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_search_response.dart';

enum SearchState { Initial, Loading, HasData, NoData, Error }

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiServices apiService;

  RestaurantSearchProvider({required this.apiService});

  late RestaurantSearchResponse _searchResult;
  SearchState _state = SearchState.Initial;
  String _message = '';

  RestaurantSearchResponse get result => _searchResult;
  SearchState get state => _state;
  String get message => _message;

  Future<void> searchRestaurants(String query) async {
    try {
      _state = SearchState.Loading;
      notifyListeners();

      final result = await apiService.searchRestaurant(query);

      if (result.restaurants.isEmpty) {
        _state = SearchState.NoData;
        _message = 'No restaurants found';
      } else {
        _state = SearchState.HasData;
        _searchResult = result;
      }
    } catch (e) {
      _state = SearchState.Error;
      _message = 'Error occurred: $e';
    }
    notifyListeners();
  }
}
