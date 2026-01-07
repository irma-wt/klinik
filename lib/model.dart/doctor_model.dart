// Model untuk Doctor
class Doctor {
  final String name;
  final String specialty;
  final double rating;
  final String distance;
  final String image;
  final String about;

  Doctor({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.distance,
    required this.image,
    this.about = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
  });
}