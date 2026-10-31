import 'package:flutter/material.dart';

import 'data/coffee.dart';
import 'pages/about_page.dart';
import 'pages/brew_guide_page.dart';
import 'pages/coffee_detail_page.dart';
import 'pages/coffee_list_page.dart';
import 'pages/find_coffee_page.dart';
import 'theme.dart';

void main() {
  runApp(const KopiNusantaraApp());
}

class KopiNusantaraApp extends StatelessWidget {
  const KopiNusantaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kopi Nusantara',
      debugShowCheckedModeBanner: false,
      theme: buildKopiTheme(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _open(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          children: [
            const _BrandBar(),
            const SizedBox(height: 20),
            _FindCoffeeBanner(
              onTap: () => _open(context, const FindCoffeePage()),
            ),
            const SizedBox(height: 28),
            Text(
              'Jelajahi',
              style: Theme.of(context).textTheme.titleLarge
                  ?.copyWith(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            const Text(
              'Empat cara untuk mengenal kopi Nusantara.',
              style: TextStyle(color: coffeeMedium, height: 1.4),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 1.08,
              children: [
                _MenuCard(
                  icon: Icons.menu_book_outlined,
                  title: 'Daftar Kopi',
                  subtitle: '10 biji pilihan',
                  onTap: () => _open(context, const CoffeeListPage()),
                ),
                _MenuCard(
                  icon: Icons.local_cafe_outlined,
                  title: 'Kopi Pilihan',
                  subtitle: coffees.first.name,
                  onTap: () =>
                      _open(context, CoffeeDetailPage(coffee: coffees.first)),
                ),
                _MenuCard(
                  icon: Icons.coffee_maker_outlined,
                  title: 'Panduan Seduh',
                  subtitle: '4 metode',
                  onTap: () => _open(context, const BrewGuidePage()),
                ),
                _MenuCard(
                  icon: Icons.info_outline,
                  title: 'Tentang',
                  subtitle: 'Aplikasi & pembuat',
                  onTap: () => _open(context, const AboutPage()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandBar extends StatelessWidget {
  const _BrandBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: coffeeBrown,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.local_cafe, color: cream),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kopi Nusantara',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Text(
              'Katalog kopi Indonesia',
              style: TextStyle(fontSize: 12, color: coffeeMedium),
            ),
          ],
        ),
      ],
    );
  }
}

class _FindCoffeeBanner extends StatelessWidget {
  const _FindCoffeeBanner({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [coffeeDark, coffeeBrown],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: coffeeDark.withValues(alpha: 0.22),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.auto_awesome, color: latte, size: 14),
                SizedBox(width: 6),
                Text(
                  'FITUR UTAMA',
                  style: TextStyle(
                    color: latte,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Temukan Kopimu',
            style: TextStyle(
              color: cream,
              fontSize: 30,
              height: 1.15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Jawab 3 pertanyaan singkat, dan kami carikan kopi Nusantara yang paling cocok dengan seleramu.',
            style: TextStyle(color: cream.withValues(alpha: 0.78), height: 1.5),
          ),
          const SizedBox(height: 22),
          FilledButton.icon(
            onPressed: onTap,
            icon: const Icon(Icons.tune, size: 18),
            label: const Text('Mulai Pencocokan'),
            style: FilledButton.styleFrom(
              backgroundColor: cream,
              foregroundColor: coffeeDark,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cardCream,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: creamDark),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: creamDark,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: coffeeBrown, size: 22),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: coffeeMedium),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
