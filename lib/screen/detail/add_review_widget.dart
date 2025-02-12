import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/style/colors/restaurant_color.dart';

class AddReviewWidget extends StatefulWidget {
  final String restaurantId;

  const AddReviewWidget({super.key, required this.restaurantId});

  @override
  _AddReviewWidgetState createState() => _AddReviewWidgetState();
}

class _AddReviewWidgetState extends State<AddReviewWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Add a Review',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.black)),
        const SizedBox(height: 10),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _reviewController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Your Review",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your review";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: RestaurantColor.primary.color,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<RestaurantDetailProvider>(context,
                              listen: false)
                          .addReview(widget.restaurantId, _nameController.text,
                              _reviewController.text);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Review added!")),
                      );

                      _nameController.clear();
                      _reviewController.clear();
                    }
                  },
                  child: Text("Submit Review",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: RestaurantColor.white.color,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
