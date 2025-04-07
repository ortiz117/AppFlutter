import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  final int rating;
  final ValueChanged<int>? onRatingChanged;
  final String title;

  const RatingSection({
    Key? key,
    required this.rating,
    this.onRatingChanged,
    this.title = 'Califica:', // Título por defecto
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 30,
              ),
              onPressed: () {
                if (onRatingChanged != null) {
                  onRatingChanged!(index + 1);
                }
              },
            );
          }),
        ),
      ],
    );
  }
}
