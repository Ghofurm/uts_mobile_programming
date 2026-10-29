import 'package:flutter/material.dart';

import '../data/coffee.dart';
import '../theme.dart';
import 'brew_guide_page.dart';

class CoffeeDetailPage extends StatelessWidget {
  const CoffeeDetailPage({super.key, required this.coffee});

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Kembali',
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(coffee.name),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              height: 240,
              width: double.infinity,
              color: creamDark,
              child: Image.network(
                coffee.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: coffeeMedium,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.place_outlined,
                          size: 16,
                          color: coffeeMedium,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          coffee.origin,
                          style: const TextStyle(
                            fontSize: 14,
                            color: coffeeMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: coffeeDark,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  coffee.price,
                  style: const TextStyle(
                    color: cream,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _InfoTile(
                  icon: Icons.terrain_outlined,
                  label: 'Asal',
                  value: coffee.origin,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _InfoTile(
                  icon: Icons.local_fire_department_outlined,
                  label: 'Tingkat Roast',
                  value: coffee.roastLevel,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Tasting Notes'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: coffee.tastingNotes.split(',').map((note) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: creamDark,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  note.trim(),
                  style: const TextStyle(
                    color: coffeeBrown,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Tentang Kopi Ini'),
          const SizedBox(height: 10),
          Text(
            coffee.description,
            style: const TextStyle(fontSize: 14.5, height: 1.65),
          ),
          const SizedBox(height: 28),
          OutlinedButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BrewGuidePage()),
            ),
            icon: const Icon(Icons.coffee_maker_outlined),
            label: const Text('Lihat Panduan Seduh'),
            style: OutlinedButton.styleFrom(
              foregroundColor: coffeeBrown,
              side: const BorderSide(color: coffeeBrown),
              padding: const EdgeInsets.symmetric(vertical: 14),
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardCream,
        border: Border.all(color: creamDark),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: creamDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: coffeeBrown),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 11, color: coffeeMedium),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
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
