import 'package:flutter/material.dart';

// FAQScreen
class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqs = [
      {
        'question': 'Bagaimana cara membuat janji dengan dokter?',
        'answer':
            'Anda dapat membuat janji dengan memilih dokter dari daftar Top Doctor di halaman Home, kemudian pilih tanggal dan waktu yang tersedia, lalu klik tombol "Book Appointment".',
      },
      {
        'question': 'Bagaimana cara membatalkan janji?',
        'answer':
            'Buka menu Schedule dari halaman Profile atau bottom navigation, pilih janji yang ingin dibatalkan, lalu klik tombol "Cancel" pada kartu appointment.',
      },
      {
        'question': 'Apakah saya bisa mengubah jadwal appointment?',
        'answer':
            'Ya, Anda dapat membatalkan appointment yang ada dan membuat appointment baru dengan jadwal yang berbeda.',
      },
      {
        'question': 'Bagaimana cara memesan obat?',
        'answer':
            'Buka menu Pharmacy dari halaman Home, pilih obat yang diinginkan, tambahkan ke keranjang, lalu lakukan checkout untuk menyelesaikan pemesanan.',
      },
      {
        'question': 'Metode pembayaran apa yang tersedia?',
        'answer':
            'Saat ini kami mendukung pembayaran melalui kartu kredit/debit (Visa, Mastercard) dan transfer bank.',
      },
      {
        'question': 'Bagaimana cara mengubah foto profil?',
        'answer':
            'Buka halaman Profile, klik ikon pensil pada foto profil Anda, lalu pilih gambar dari galeri untuk mengubah foto profil.',
      },
      {
        'question': 'Apakah data saya aman?',
        'answer':
            'Ya, kami menggunakan enkripsi end-to-end untuk melindungi semua data pribadi dan medis Anda. Data Anda tidak akan dibagikan kepada pihak ketiga tanpa izin Anda.',
      },
      {
        'question': 'Bagaimana cara menghubungi customer service?',
        'answer':
            'Anda dapat menghubungi kami melalui email di support@healthapp.com atau melalui fitur chat yang tersedia di menu Help Center.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'FAQs',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return _FAQItem(
            question: faqs[index]['question']!,
            answer: faqs[index]['answer']!,
          );
        },
      ),
    );
  }
}

class _FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FAQItem({required this.question, required this.answer});

  @override
  State<_FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<_FAQItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          title: Text(
            widget.question,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.teal,
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              isExpanded = expanded;
            });
          },
          children: [
            Text(
              widget.answer,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
