class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
// final List<Restaurant> restaurantList = [
//   Restaurant(
//       name: 'Restaurant 1',
//       location: 'St. Somewhere on earth',
//       rating: 4.6,
//       image:
//           "https://img.freepik.com/free-vector/spicy-salmon-salad-spicy-food-restaurant-logo-hand-draw-vector-illustration_56104-2136.jpg?t=st=1739025721~exp=1739029321~hmac=eb7deda77947db6ca8b06a39d0ba1ecbd1156b8a51f5f37abb0eab87af62db9f&w=1480"),
//   Restaurant(
//       name: 'Restaurant 2',
//       location: 'St. Somewhere on earth',
//       rating: 4.5,
//       image:
//           "https://img.freepik.com/free-vector/spicy-salmon-salad-spicy-food-restaurant-logo-hand-draw-vector-illustration_56104-2136.jpg?t=st=1739025721~exp=1739029321~hmac=eb7deda77947db6ca8b06a39d0ba1ecbd1156b8a51f5f37abb0eab87af62db9f&w=1480"),
//   Restaurant(
//       name: 'Restaurant 3',
//       location: 'St. Somewhere on earth',
//       rating: 4.8,
//       image:
//           "https://img.freepik.com/free-vector/spicy-salmon-salad-spicy-food-restaurant-logo-hand-draw-vector-illustration_56104-2136.jpg?t=st=1739025721~exp=1739029321~hmac=eb7deda77947db6ca8b06a39d0ba1ecbd1156b8a51f5f37abb0eab87af62db9f&w=1480"),
//   Restaurant(
//       name: 'Restaurant 4',
//       location: 'St. Somewhere on earth',
//       rating: 4.6,
//       image:
//           "https://img.freepik.com/free-vector/spicy-salmon-salad-spicy-food-restaurant-logo-hand-draw-vector-illustration_56104-2136.jpg?t=st=1739025721~exp=1739029321~hmac=eb7deda77947db6ca8b06a39d0ba1ecbd1156b8a51f5f37abb0eab87af62db9f&w=1480"),
//   Restaurant(
//       name: 'Restaurant 5',
//       location: 'St. Somewhere on earth',
//       rating: 4.9,
//       image:
//           "https://img.freepik.com/free-vector/spicy-salmon-salad-spicy-food-restaurant-logo-hand-draw-vector-illustration_56104-2136.jpg?t=st=1739025721~exp=1739029321~hmac=eb7deda77947db6ca8b06a39d0ba1ecbd1156b8a51f5f37abb0eab87af62db9f&w=1480"),
//   Restaurant(
//       name: 'Restaurant 6',
//       location: 'St. Somewhere on earth',
//       rating: 4.3,
//       image:
//           "https://img.freepik.com/free-vector/spicy-salmon-salad-spicy-food-restaurant-logo-hand-draw-vector-illustration_56104-2136.jpg?t=st=1739025721~exp=1739029321~hmac=eb7deda77947db6ca8b06a39d0ba1ecbd1156b8a51f5f37abb0eab87af62db9f&w=1480"),
//   Restaurant(
//       name: 'Restaurant 7',
//       location: 'St. Somewhere on earth',
//       rating: 4.5,
//       image:
//           "https://img.freepik.com/free-vector/spicy-salmon-salad-spicy-food-restaurant-logo-hand-draw-vector-illustration_56104-2136.jpg?t=st=1739025721~exp=1739029321~hmac=eb7deda77947db6ca8b06a39d0ba1ecbd1156b8a51f5f37abb0eab87af62db9f&w=1480"),
// ];
