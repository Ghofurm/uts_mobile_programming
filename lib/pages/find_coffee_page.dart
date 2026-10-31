import 'package:flutter/material.dart';

import '../data/coffee.dart';
import '../theme.dart';
import 'coffee_detail_page.dart';

class FindCoffeePage extends StatefulWidget {
  const FindCoffeePage({super.key});

  @override
  State<FindCoffeePage> createState() => _FindCoffeePageState();
}

class _FindCoffeePageState extends State<FindCoffeePage> {
  static const List<_Option> _tasteOptions = [
    _Option(
      label: 'Fruity & Floral',
      hint: 'Jeruk, bunga, teh',
      icon: Icons.local_florist_outlined,
    ),
    _Option(
      label: 'Cokelat & Kacang',
      hint: 'Kakao, karamel, almond',
      icon: Icons.cookie_outlined,
    ),
    _Option(
      label: 'Rempah & Herbal',
      hint: 'Rempah, tembakau, earthy',
      icon: Icons.spa_outlined,
    ),
  ];

  static const List<_Option> _roastOptions = [
    _Option(
      label: 'Light',
      hint: 'Ringan dan bersih',
      icon: Icons.wb_sunny_outlined,
    ),
    _Option(
      label: 'Medium',
      hint: 'Seimbang dan manis',
      icon: Icons.tonality_outlined,
    ),
    _Option(
      label: 'Dark',
      hint: 'Pekat dan kuat',
      icon: Icons.dark_mode_outlined,
    ),
  ];

  static const List<_Option> _brewOptions = [
    _Option(
      label: 'V60',
      hint: 'Seduh manual',
      icon: Icons.filter_alt_outlined,
    ),
    _Option(
      label: 'French Press',
      hint: 'Body tebal',
      icon: Icons.coffee_outlined,
    ),
    _Option(
      label: 'Moka Pot',
      hint: 'Pekat seperti espresso',
      icon: Icons.coffee_maker_outlined,
    ),
    _Option(
      label: 'Kopi Tubruk',
      hint: 'Cara klasik Indonesia',
      icon: Icons.emoji_food_beverage_outlined,
    ),
  ];

  static const Map<String, List<String>> _tasteKeywords = {
    'Fruity & Floral': [
      'jeruk',
      'lemon',
      'apel',
      'buah',
      'floral',
      'melati',
      'teh',
      'madu',
    ],
    'Cokelat & Kacang': [
      'cokelat',
      'chocolate',
      'kakao',
      'kacang',
      'almond',
      'karamel',
      'gula',
    ],
    'Rempah & Herbal': [
      'rempah',
      'herbal',
      'kayu manis',
      'tembakau',
      'earthy',
      'smoky',
    ],
  };

  static const List<String> _roastScale = [
    'Light',
    'Light-Medium',
    'Medium',
    'Medium-Dark',
    'Dark',
  ];

  static const Map<String, int> _roastTargets = {
    'Light': 0,
    'Medium': 2,
    'Dark': 4,
  };

  static const Map<String, int> _brewRoastTargets = {
    'V60': 0,
    'French Press': 3,
    'Moka Pot': 4,
    'Kopi Tubruk': 4,
  };

  int _step = 0;
  _Option? _taste;
  _Option? _roast;
  _Option? _brew;
  List<Coffee> _results = const [];

  _Option? get _selection => switch (_step) {
    0 => _taste,
    1 => _roast,
    2 => _brew,
    _ => null,
  };

  void _select(_Option option) {
    setState(() {
      switch (_step) {
        case 0:
          _taste = option;
        case 1:
          _roast = option;
        case 2:
          _brew = option;
      }
    });
  }

  void _next() {
    if (_step == 2) {
      setState(() {
        _results = _recommendations();
        _step = 3;
      });
      return;
    }
    setState(() => _step++);
  }

  void _back() {
    if (_step == 0) {
      Navigator.pop(context);
      return;
    }
    setState(() => _step--);
  }

  void _restart() {
    setState(() {
      _step = 0;
      _taste = null;
      _roast = null;
      _brew = null;
      _results = const [];
    });
  }

  static int _roastIndex(String level) => _roastScale.indexOf(level);

  List<Coffee> _recommendations() {
    final keywords = _tasteKeywords[_taste!.label]!;
    final roastTarget = _roastTargets[_roast!.label]!;
    final brewTarget = _brewRoastTargets[_brew!.label]!;

    int scoreFor(Coffee coffee) {
      final notes = coffee.tastingNotes.toLowerCase();
      final tasteHits = keywords.where(notes.contains).length;
      final roastDiff = (_roastIndex(coffee.roastLevel) - roastTarget).abs();
      final brewDiff = (_roastIndex(coffee.roastLevel) - brewTarget).abs();

      final roastScore = roastDiff <= 1 ? 3 : (roastDiff == 2 ? 1 : 0);
      final brewScore = brewDiff <= 1 ? 2 : (brewDiff == 2 ? 1 : 0);
      return tasteHits * 2 + roastScore + brewScore;
    }

    final scored = [...coffees]
      ..sort((a, b) => scoreFor(b).compareTo(scoreFor(a)));
    return scored.take(3).toList();
  }

  String _reason(Coffee coffee) {
    final keywords = _tasteKeywords[_taste!.label]!;
    final notes = coffee.tastingNotes.toLowerCase();
    final matches = keywords.where(notes.contains).toList();
    final match = matches.isEmpty ? null : matches.first;
    final roastDiff =
        (_roastIndex(coffee.roastLevel) - _roastTargets[_roast!.label]!).abs();
    final brewDiff =
        (_roastIndex(coffee.roastLevel) - _brewRoastTargets[_brew!.label]!)
            .abs();

    final reasons = <String>[
      if (match != null) 'rasa $match yang kamu cari',
      if (roastDiff <= 1)
        'roast ${coffee.roastLevel.toLowerCase()} sesuai pilihan',
      if (brewDiff <= 1) 'cocok diseduh dengan ${_brew!.label}',
    ];
    if (reasons.isEmpty) {
      return 'Pilihan terdekat dari katalog untuk preferensimu.';
    }
    return 'Kopi ini punya ${reasons.join(', ')}.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Kembali',
          onPressed: _back,
        ),
        title: const Text('Temukan Kopimu'),
      ),
      body: SafeArea(
        child: _step == 3 ? _buildResults(context) : _buildQuestion(context),
      ),
    );
  }

  Widget _buildQuestion(BuildContext context) {
    final options = switch (_step) {
      0 => _tasteOptions,
      1 => _roastOptions,
      _ => _brewOptions,
    };
    final title = switch (_step) {
      0 => 'Karakter rasa apa yang kamu cari?',
      1 => 'Seberapa pekat roast favoritmu?',
      _ => 'Biasanya kamu menyeduh dengan apa?',
    };
    final subtitle = switch (_step) {
      0 => 'Pilih satu profil yang paling menggoda.',
      1 => 'Tingkat roast memengaruhi body dan kemanisan.',
      _ => 'Metode seduh membantu menentukan profil yang pas.',
    };
    final selection = _selection;

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            children: [
              _StepProgress(step: _step),
              const SizedBox(height: 24),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: coffeeMedium,
                ),
              ),
              const SizedBox(height: 20),
              for (final option in options)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _OptionCard(
                    option: option,
                    selected: selection?.label == option.label,
                    onTap: () => _select(option),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: selection == null ? null : _next,
              style: FilledButton.styleFrom(
                backgroundColor: coffeeBrown,
                foregroundColor: cream,
                disabledBackgroundColor: creamDark,
                disabledForegroundColor: coffeeMedium,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(_step == 2 ? 'Lihat Rekomendasi' : 'Lanjut'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResults(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
      children: [
        const _StepProgress(step: 3),
        const SizedBox(height: 24),
        const Text(
          'Rekomendasi untukmu',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        Text(
          'Berdasarkan ${_taste!.label}, roast ${_roast!.label}, dan ${_brew!.label}.',
          style: const TextStyle(
            fontSize: 14,
            height: 1.5,
            color: coffeeMedium,
          ),
        ),
        const SizedBox(height: 20),
        for (final (index, coffee) in _results.indexed)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _ResultCard(
              coffee: coffee,
              rank: index + 1,
              reason: _reason(coffee),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CoffeeDetailPage(coffee: coffee),
                ),
              ),
            ),
          ),
        const SizedBox(height: 4),
        OutlinedButton.icon(
          onPressed: _restart,
          icon: const Icon(Icons.refresh),
          label: const Text('Ulangi Pencocokan'),
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
    );
  }
}

class _Option {
  const _Option({required this.label, required this.hint, required this.icon});

  final String label;
  final String hint;
  final IconData icon;
}

class _StepProgress extends StatelessWidget {
  const _StepProgress({required this.step});

  final int step;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < 3; index++)
          Expanded(
            child: Container(
              height: 5,
              margin: EdgeInsets.only(right: index < 2 ? 8 : 0),
              decoration: BoxDecoration(
                color: index <= step ? coffeeBrown : creamDark,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
      ],
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final _Option option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: selected ? creamDark : cardCream,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(
            color: selected ? coffeeBrown : creamDark,
            width: selected ? 1.6 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: selected ? coffeeBrown : creamDark,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    option.icon,
                    size: 20,
                    color: selected ? cream : coffeeBrown,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        option.label,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        option.hint,
                        style: const TextStyle(
                          fontSize: 12,
                          color: coffeeMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  selected ? Icons.check_circle : Icons.radio_button_unchecked,
                  size: 22,
                  color: selected ? coffeeBrown : coffeeMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({
    required this.coffee,
    required this.rank,
    required this.reason,
    required this.onTap,
  });

  final Coffee coffee;
  final int rank;
  final String reason;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cardCream,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: creamDark),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  coffee.imageUrl,
                  width: 84,
                  height: 84,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 84,
                    height: 84,
                    color: creamDark,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      color: coffeeMedium,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PILIHAN $rank',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: caramel,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      coffee.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${coffee.origin} • roast ${coffee.roastLevel}',
                      style: const TextStyle(fontSize: 12, color: coffeeMedium),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      reason,
                      style: const TextStyle(fontSize: 12.5, height: 1.4),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4, left: 6),
                child: Icon(Icons.chevron_right, size: 20, color: coffeeMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
