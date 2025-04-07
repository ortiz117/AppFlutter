import 'package:flutter/material.dart';
import 'package:app_pets/models/Pas_card.dart';
import 'package:app_pets/models/Paseador.dart';

class PaseadoresFunctionScreen extends StatefulWidget {
  const PaseadoresFunctionScreen({super.key});

  @override
  State<PaseadoresFunctionScreen> createState() => _PaseadoresFunctionState();
}

class _PaseadoresFunctionState extends State<PaseadoresFunctionScreen> {
  int? selectedPaseadorIndex;
  List<Paseador> paseadores = Paseador.paseadoresEjemplo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Paseadores Disponibles',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda(Para cuando la implemente)
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFilterChip('Todos'),
                _buildFilterChip('Cercanos'),
                _buildFilterChip('Mejor valorados'),
                _buildFilterChip('Experiencia'),
                _buildFilterChip('Precio'),
              ],
            ),
          ),
          Expanded(
            child: Stack(
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
                ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: paseadores.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return PaseadorCard(
                      paseador: paseadores[index],
                      isSelected: selectedPaseadorIndex == index,
                      onTap:
                          () => setState(() {
                            selectedPaseadorIndex =
                                selectedPaseadorIndex == index ? null : index;
                          }),
                      onRatingChanged: (rating) {
                        setState(() {
                          paseadores[index].calificacion = rating;
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton:
          selectedPaseadorIndex != null
              ? FloatingActionButton.extended(
                icon: const Icon(Icons.pets, color: Colors.white),
                label: const Text(
                  'Contratar Servicio',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green.shade600,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: () {
                  // Navegar a pantalla de contratación(Cuando la cree)
                },
              )
              : null,
    );
  }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        onSelected: (bool value) {
          // Acción de filtrado(No hay aun)
        },
        backgroundColor: Colors.grey.shade100,
        selectedColor: Colors.green.shade100,
        labelStyle: const TextStyle(color: Colors.black87),
        shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade300)),
      ),
    );
  }
}
