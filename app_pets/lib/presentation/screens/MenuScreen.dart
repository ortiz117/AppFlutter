import 'package:app_pets/presentation/screens/MapaFunctionScreen.dart';
import 'package:flutter/material.dart';
import 'package:app_pets/presentation/screens/PaseadoresFunctionScreen.dart';
import 'package:app_pets/presentation/screens/SpaFunctionScreen.dart';
import 'package:app_pets/presentation/screens/VeterinariosFunctionScreen.dart';

class MenuFunctionScreen extends StatelessWidget {
  const MenuFunctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF6DD5FA), Color(0xFFA18CD1)],
              ),
            ),
          ),

          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),

          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 80),

                const Text(
                  'Cuidamos a tu\nmejor amigo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Servicios premium para mascotas',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),

                const SizedBox(height: 40),

                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.85,
                    children: [
                      _buildServiceCard(
                        context,
                        icon: Icons.medical_services,
                        title: 'Veterinarios',
                        color: const Color(0xFFFF9A8B),
                        destination: const VeterinariosScreen(),
                      ),

                      _buildServiceCard(
                        context,
                        icon: Icons.directions_walk,
                        title: 'Paseadores',
                        color: const Color(0xFF4FACFE),
                        destination: const PaseadoresFunctionScreen(),
                      ),

                      _buildServiceCard(
                        context,
                        icon: Icons.spa,
                        title: 'SPA',
                        color: const Color(0xFFA6C1EE),
                        destination: const SpaFunctionScreen(),
                      ),

                      _buildServiceCard(
                        context,
                        icon: Icons.map,
                        title: 'Mapa',
                        color: const Color(0xFF84FAB0),
                        destination: const MapaFunctionScreen(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    Widget? destination,
    VoidCallback? onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap:
          onTap ??
          () {
            if (destination != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination),
              );
            }
          },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 36, color: color),
            ),

            const SizedBox(height: 20),

            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
