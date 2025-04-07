import 'package:app_pets/models/Paseador.dart';
import 'package:flutter/material.dart';

class PaseadorCard extends StatelessWidget {
  final Paseador paseador;
  final bool isSelected;
  final VoidCallback onTap;
  final ValueChanged<int>? onRatingChanged;

  const PaseadorCard({
    super.key,
    required this.paseador,
    required this.isSelected,
    required this.onTap,
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? Colors.green : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado con foto y nombre
              Row(
                children: [
                  CircleAvatar(),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          paseador.nombre,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          paseador.experiencia,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        Text(
                          '\$${paseador.tarifaHora.toStringAsFixed(2)} por hora',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isSelected)
                    const Icon(Icons.check_circle, color: Colors.green),
                ],
              ),

              const SizedBox(height: 12),

              // Descripción
              Text(paseador.descripcion, style: const TextStyle(fontSize: 14)),

              const SizedBox(height: 12),

              // Calificación
              if (onRatingChanged != null) ...[
                const Divider(),
                _buildRatingSection(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Califica a este paseador:',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < paseador.calificacion ? Icons.star : Icons.star_border,
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
