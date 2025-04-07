class Veterinario {
  final String nombre;
  final String especialidad;
  final String descripcion;
  final String? imagen;
  int calificacion; // Puede cambiar, por eso no es final

  Veterinario({
    required this.nombre,
    required this.especialidad,
    required this.descripcion,
    this.imagen,
    this.calificacion = 0,
  });

  // Método para crear una lista de veterinarios de ejemplo
  static List<Veterinario> veterinariosEjemplo() {
    return [
      Veterinario(
        nombre: 'Dr. Martínez',
        especialidad: 'Cardiólogo Veterinario',
        descripcion:
            'Especializado en cardiología animal con más de 10 años de experiencia. Graduado de la Universidad Nacional.',
        // imagen: 'assets/Doctor.png',
      ),
      Veterinario(
        nombre: 'Dra. García',
        especialidad: 'Dermatóloga Veterinaria',
        descripcion:
            'Experta en problemas de piel y alergias en mascotas. Realizó sus estudios de posgrado en España.',
        // imagen: 'assets/Doctor.png',
      ),
      Veterinario(
        nombre: 'Dr. López',
        especialidad: 'Cirujano Veterinario',
        descripcion:
            'Especialista en cirugías de tejidos blandos y ortopedia. Ha realizado más de 500 cirugías exitosas.',
        // imagen: 'assets/Doctor.png',
      ),
      Veterinario(
        nombre: 'Dra. Rodríguez',
        especialidad: 'Oftalmóloga Veterinaria',
        descripcion:
            'Especialista en problemas oculares en animales pequeños y exóticos. Miembro de la asociación internacional.',
        // imagen: 'assets/Doctor.png',
      ),
    ];
  }
}
