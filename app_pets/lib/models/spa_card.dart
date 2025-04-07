import 'package:app_pets/Widgets/rating_section.dart';
import 'package:flutter/material.dart';
import 'package:app_pets/models/spa_service.dart';

class SpaCard extends StatelessWidget {
  final SpaService spa;
  final bool isSelected;
  final VoidCallback onTap;
  final ValueChanged<double> onRatingChanged;

  const SpaCard({
    super.key,
    required this.spa,
    required this.isSelected,
    required this.onTap,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 8.0 : 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          width: 2.0,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      spa.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      spa.description,
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    // Aquí agregamos el RatingSection widget
                    RatingSection(
                      title: 'Califica este spa:',
                      rating:
                          spa.rating
                              .floor(), // Pasamos la parte entera de la calificación
                      onRatingChanged: (newRating) {
                        // Convertimos la calificación entera a double antes de llamar al callback del SpaCard
                        onRatingChanged(newRating.toDouble());
                      },
                    ),
                  ],
                ),
              ),
              // Icono para indicar selección (opcional)
              if (isSelected)
                Icon(Icons.check_circle, color: Theme.of(context).primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
