import 'package:app_pets/models/Vet_card.dart';
import 'package:flutter/material.dart';
import 'package:app_pets/models/veterinario.dart';

class VeterinariosScreen extends StatefulWidget {
  const VeterinariosScreen({super.key});

  @override
  State<VeterinariosScreen> createState() => _VeterinariosScreenState();
}

class _VeterinariosScreenState extends State<VeterinariosScreen> {
  int? selectedVetIndex;
  List<Veterinario> veterinarios = Veterinario.veterinariosEjemplo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuestros Veterinarios'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade100, Colors.purple.shade100],
                ),
              ),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: veterinarios.length,
            itemBuilder: (context, index) {
              return VetCard(
                vet: veterinarios[index],
                isSelected: selectedVetIndex == index,
                onTap:
                    () => setState(() {
                      selectedVetIndex =
                          selectedVetIndex == index ? null : index;
                    }),
                onRatingChanged: (rating) {
                  setState(() {
                    veterinarios[index].calificacion = rating;
                  });
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton:
          selectedVetIndex != null
              ? FloatingActionButton.extended(
                icon: const Icon(Icons.calendar_today),
                label: const Text('Agendar Cita'),
                onPressed: () {
                  // Navegar a pantalla de agendar cita(Cuando la cree)
                },
              )
              : null,
    );
  }
}
