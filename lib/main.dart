import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/screen/detail/detail_restaurant.dart';
import 'package:restaurant_app/screen/home/restaurant_list_page.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/style/theme/restaurant_theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => ApiServices()),
      ChangeNotifierProvider(
          create: (context) => RestaurantListProvider(
                context.read<ApiServices>(),
              )),
      ChangeNotifierProvider(
          create: (context) => RestaurantDetailProvider(
                context.read<ApiServices>(),
              ))
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: RestaurantTheme.lightTheme,
      darkTheme: RestaurantTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: NavigationRoute.homeRoute.name,
      routes: {
        NavigationRoute.homeRoute.name: (context) => RestaurantListPage(),
        NavigationRoute.detailRoute.name: (context) => DetailRestaurant(
              restaurantID:
                  ModalRoute.of(context)?.settings.arguments.toString() ?? "",
            ),
      },
    );
  }
}
