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
    String? about,
  }) : about = about ?? _generateDefaultAbout(name, specialty);

  static String _generateDefaultAbout(String name, String specialty) {
    final descriptions = {
      'Chardiologist': 'Dokter spesialis jantung yang berpengalaman dalam menangani berbagai kondisi kardiovaskular. Memiliki keahlian dalam diagnosis dan pengobatan penyakit jantung, tekanan darah tinggi, dan gangguan pembuluh darah.',
      'Psychologist': 'Psikolog klinis berpengalaman yang membantu pasien mengatasi stres, kecemasan, depresi, dan masalah kesehatan mental lainnya. Menggunakan pendekatan terapi yang holistik dan personal.',
      'Orthopedic': 'Dokter spesialis ortopedi yang menangani masalah tulang, sendi, dan otot. Berpengalaman dalam penanganan cedera olahraga, nyeri punggung, dan rehabilitasi pasca operasi.',
      'Dermatologist': 'Dokter spesialis kulit yang menangani berbagai kondisi kulit, rambut, dan kuku. Ahli dalam perawatan jerawat, eksim, dan prosedur estetika kulit.',
      'Pediatrician': 'Dokter spesialis anak yang berdedikasi untuk kesehatan dan perkembangan anak-anak. Menangani imunisasi, tumbuh kembang, dan penyakit anak.',
      'Neurologist': 'Dokter spesialis saraf yang menangani gangguan otak, sumsum tulang belakang, dan sistem saraf. Ahli dalam penanganan sakit kepala, epilepsi, dan gangguan neurologis lainnya.',
    };
    return descriptions[specialty] ?? 
        '$name adalah dokter $specialty yang berdedikasi dan berpengalaman dalam memberikan pelayanan kesehatan terbaik kepada pasien. Berkomitmen untuk memberikan diagnosis yang akurat dan perawatan yang efektif.';
  }
}