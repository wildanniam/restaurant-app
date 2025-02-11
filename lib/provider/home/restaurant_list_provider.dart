import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';

class RestaurantListProvider extends ChangeNotifier {
  final ApiServices _apiServices;
  RestaurantListProvider(this._apiServices);

  RestaurantListResultState _resultState = RestaurantListNoneState();
  RestaurantListResultState get resultState => _resultState;

  Future<void> fetchListRestaurant() async {
    try {
      _resultState = RestaurantListLoadingState();
      notifyListeners();

      final result = await _apiServices.getRestaurantList();

      if (result.error) {
        _resultState = RestaurantListErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = RestaurantListLoadedState(result.restaurants);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = RestaurantListErrorState(e.toString());
      notifyListeners();
    }
  }

  Future<void> searchRestaurant(String query) async {
    if (query.isEmpty) {
      await fetchListRestaurant();
      return;
    }
    try {
      final searchResult = await _apiServices.searchRestaurant(query);
      if (searchResult.restaurants.isEmpty) {
        _resultState =
            RestaurantListErrorState('No restaurants found for "$query"');
      } else {
        _resultState = RestaurantListLoadedState(searchResult.restaurants);
      }
    } catch (e) {
      _resultState = RestaurantListErrorState(e.toString());
    }
    notifyListeners();
  }
}
