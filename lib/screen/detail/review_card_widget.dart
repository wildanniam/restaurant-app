import 'package:flutter/material.dart';

class ReviewCardWidget extends StatelessWidget {
  final String name;
  final String review;
  final String date;

  const ReviewCardWidget({
    super.key,
    required this.name,
    required this.review,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama dan Tanggal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(date, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: 10),

              // Review
              Text(
                review,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 3, // Batas maksimum 3 baris
                overflow: TextOverflow.ellipsis, // Tambahkan ... jika overflow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
