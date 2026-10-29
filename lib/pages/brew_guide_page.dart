import 'package:flutter/material.dart';

import '../theme.dart';

class BrewGuidePage extends StatelessWidget {
  const BrewGuidePage({super.key});

  static const List<_BrewMethod> _methods = [
    _BrewMethod(
      name: 'V60',
      subtitle: 'Seduh manual dengan rasa bersih',
      icon: Icons.filter_alt_outlined,
      ratio: '15 g : 250 ml',
      grind: 'Sedang-halus',
      steps: [
        'Basahi filter dengan air panas, lalu buang airnya.',
        'Masukkan kopi, tuang 45 ml air 92°C dan tunggu 30 detik.',
        'Tuang air perlahan melingkar hingga total 250 ml.',
        'Tunggu tetesan selesai, sekitar 3 menit, lalu sajikan.',
      ],
    ),
    _BrewMethod(
      name: 'French Press',
      subtitle: 'Body tebal dan aroma kuat',
      icon: Icons.coffee_outlined,
      ratio: '20 g : 300 ml',
      grind: 'Kasar',
      steps: [
        'Panaskan French Press dengan air panas, lalu buang airnya.',
        'Masukkan kopi dan tuang seluruh air 94°C.',
        'Aduk perlahan, tutup, dan diamkan selama 4 menit.',
        'Tekan plunger perlahan, lalu tuang ke cangkir.',
      ],
    ),
    _BrewMethod(
      name: 'Moka Pot',
      subtitle: 'Pekat seperti espresso rumahan',
      icon: Icons.coffee_maker_outlined,
      ratio: '18 g : 150 ml',
      grind: 'Halus-sedang',
      steps: [
        'Isi bagian bawah moka pot dengan air panas hingga katup.',
        'Masukkan kopi ke filter, ratakan tanpa dipadatkan.',
        'Pasang bagian atas dan letakkan di atas api kecil.',
        'Angkat saat kopi mulai berbunyi mendesis, lalu sajikan.',
      ],
    ),
    _BrewMethod(
      name: 'Kopi Tubruk',
      subtitle: 'Cara klasik Indonesia',
      icon: Icons.emoji_food_beverage_outlined,
      ratio: '12 g : 200 ml',
      grind: 'Halus',
      steps: [
        'Masukkan kopi ke dalam cangkir tahan panas.',
        'Tuang air mendidih perlahan hingga cangkir hampir penuh.',
        'Diamkan 3–4 menit agar ampas mengendap.',
        'Aduk sedikit sebelum diminum, nikmati selagi hangat.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panduan Seduh')),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        itemCount: _methods.length + 1,
        separatorBuilder: (_, _) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text(
                'Empat metode sederhana untuk menyeduh kopi Nusantara di rumah.',
                style: TextStyle(
                  fontSize: 14.5,
                  height: 1.6,
                  color: coffeeMedium,
                ),
              ),
            );
          }
          return _MethodCard(method: _methods[index - 1], number: index);
        },
      ),
    );
  }
}

class _BrewMethod {
  const _BrewMethod({
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.ratio,
    required this.grind,
    required this.steps,
  });

  final String name;
  final String subtitle;
  final IconData icon;
  final String ratio;
  final String grind;
  final List<String> steps;
}

class _MethodCard extends StatelessWidget {
  const _MethodCard({required this.method, required this.number});

  final _BrewMethod method;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardCream,
        border: Border.all(color: creamDark),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: coffeeDark,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(method.icon, color: latte, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      method.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      method.subtitle,
                      style: const TextStyle(fontSize: 12, color: coffeeMedium),
                    ),
                  ],
                ),
              ),
              Text(
                '0$number',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: latte,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _MetaChip(icon: Icons.scale_outlined, text: method.ratio),
              _MetaChip(icon: Icons.grain_outlined, text: method.grind),
            ],
          ),
          const SizedBox(height: 16),
          for (final (index, step) in method.steps.indexed)
            Padding(
              padding: EdgeInsets.only(
                bottom: index == method.steps.length - 1 ? 0 : 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: creamDark,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: coffeeBrown,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      step,
                      style: const TextStyle(fontSize: 13.5, height: 1.5),
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

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: cream,
        border: Border.all(color: creamDark),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: coffeeBrown),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: coffeeBrown,
            ),
          ),
        ],
      ),
    );
  }
}
