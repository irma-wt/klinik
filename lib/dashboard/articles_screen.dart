import 'package:flutter/material.dart';

// Model untuk Article
class Article {
  final String title;
  final String date;
  final String readTime;
  final String image;
  final String category;

  Article({
    required this.title,
    required this.date,
    required this.readTime,
    required this.image,
    required this.category,
  });
}

// ArticlesScreen
class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trendingArticles = [
      Article(
        title: 'Comparing the AstraZeneca and Sinovac COVID-19',
        date: 'Jun 10, 2021',
        readTime: '6 min read',
        image: 'assets/article1.jpg',
        category: 'Covid-19',
      ),
      Article(
        title: 'The Horror Of The Second Wave Of COVID-19',
        date: 'Jun 10, 2021',
        readTime: '5 min read',
        image: 'assets/article2.jpg',
        category: 'Covid-19',
      ),
    ];

    final relatedArticles = [
      Article(
        title: 'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
        date: 'Jun 10, 2021',
        readTime: '5 min read',
        image: 'assets/article3.jpg',
        category: 'Healthy',
      ),
      Article(
        title: 'Traditional Herbal Medicine Treatments for COVID-19',
        date: 'Jun 10, 2021',
        readTime: '8 min read',
        image: 'assets/article4.jpg',
        category: 'Covid-19',
      ),
      Article(
        title: 'Beauty Tips For Face: 10 Dos and Don\'ts for Naturally Beautiful Skin',
        date: 'Jun 10, 2021',
        readTime: '5 min read',
        image: 'assets/article5.jpg',
        category: 'Beauty',
      ),
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
          'Artikel',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari artikel, berita...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Popular Articles
              const Text(
                'Artikel Populer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Category Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _CategoryChip(label: 'Covid-19', isSelected: true),
                    _CategoryChip(label: 'Diet', isSelected: false),
                    _CategoryChip(label: 'Fitness', isSelected: false),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Trending Articles
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Artikel Trending',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Lihat semua'),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingArticles.length,
                  itemBuilder: (context, index) {
                    return _TrendingArticleCard(
                      article: trendingArticles[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Related Articles
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Artikel Terkait',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Lihat semua'),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: relatedArticles.length,
                itemBuilder: (context, index) {
                  return _RelatedArticleCard(
                    article: relatedArticles[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget Category Chip
class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.teal,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: isSelected ? Colors.teal : Colors.teal[50],
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}

// Widget Trending Article Card
class _TrendingArticleCard extends StatelessWidget {
  final Article article;

  const _TrendingArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.teal[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.article,
                size: 40,
                color: Colors.teal[300],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  '${article.date} • ${article.readTime}',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget Related Article Card
class _RelatedArticleCard extends StatelessWidget {
  final Article article;

  const _RelatedArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.teal[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.article,
            color: Colors.teal[300],
          ),
        ),
        title: Text(
          article.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '${article.date} • ${article.readTime}',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.bookmark_outline),
          onPressed: () {},
        ),
      ),
    );
  }
}