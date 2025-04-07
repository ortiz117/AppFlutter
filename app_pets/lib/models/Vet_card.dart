import 'package:flutter/material.dart';
import 'package:app_pets/models/veterinario.dart';

class VetCard extends StatelessWidget {
  final Veterinario vet;
  final bool isSelected;
  final VoidCallback onTap;
  final ValueChanged<int>? onRatingChanged;

  const VetCard({
    super.key,
    required this.vet,
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
          color: isSelected ? Colors.blue : Colors.grey.shade300,
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
              Row(
                children: [
                  CircleAvatar(),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vet.nombre,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          vet.especialidad,
                          style: TextStyle(color: Colors.grey.shade600),
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
              Text(vet.descripcion, style: const TextStyle(fontSize: 14)),

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
          'Califica a este veterinario:',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < vet.calificacion ? Icons.star : Icons.star_border,
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
