class SpaService {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;
  double rating;

  SpaService({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
    this.rating = 0.0,
  });

  static List<SpaService> spasEjemplo() {
    return [
      SpaService(
        id: 'spa1',
        name: 'Relax Pet Spa',
        description: 'Baño relajante y corte de pelo.',
      ),
      SpaService(
        id: 'spa2',
        name: 'Happy Paws Grooming',
        description: 'Estilismo y cuidado completo.',
        rating: 4.8,
      ),
      SpaService(
        id: 'spa3',
        name: 'Aqua Dog Spa',
        description: 'Hidroterapia y masajes.',
        rating: 4.2,
      ),
      SpaService(
        id: 'spa4',
        name: 'Zen Garden Pets',
        description: 'Tratamientos holísticos.',
        rating: 4.6,
      ),
    ];
  }
}
