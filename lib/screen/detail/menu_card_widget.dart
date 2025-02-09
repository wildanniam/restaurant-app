import 'package:flutter/material.dart';
import 'package:restaurant_app/style/colors/restaurant_color.dart';

import '../../data/models/restaurant_detail_response.dart';

class MenuCardWidget extends StatelessWidget {
  final RestaurantDetailResponse restaurant;
  final String namaMenu;
  final String type;
  const MenuCardWidget(
      {super.key,
      required this.restaurant,
      required this.namaMenu,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: IntrinsicHeight(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: type == 'Makanan' ? Colors.orange[100] : Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: type == 'Makanan' ? Colors.orange : Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  namaMenu,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
