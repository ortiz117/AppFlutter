import 'package:app_pets/models/spa_card.dart';
import 'package:app_pets/models/spa_service.dart';
import 'package:flutter/material.dart';

class SpaFunctionScreen extends StatefulWidget {
  const SpaFunctionScreen({super.key});

  @override
  State<SpaFunctionScreen> createState() => _SpaFunctionScreenState();
}

class _SpaFunctionScreenState extends State<SpaFunctionScreen> {
  int? selectedSpaIndex;
  List<SpaService> spas = SpaService.spasEjemplo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spa para Mascotas'), centerTitle: true),
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
            itemCount: spas.length,
            itemBuilder: (context, index) {
              return SpaCard(
                spa: spas[index],
                isSelected: selectedSpaIndex == index,
                onTap: () {
                  setState(() {
                    selectedSpaIndex = selectedSpaIndex == index ? null : index;
                  });
                },
                onRatingChanged: (rating) {
                  setState(() {
                    spas[index].rating = rating;
                  });
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton:
          selectedSpaIndex != null
              ? FloatingActionButton.extended(
                icon: const Icon(Icons.calendar_today),
                label: const Text('Reservar Spa'),
                onPressed: () {
                  if (selectedSpaIndex != null) {}
                },
              )
              : null,
    );
  }
}
