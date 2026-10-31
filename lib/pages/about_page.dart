import 'package:flutter/material.dart';

import '../theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [coffeeDark, coffeeBrown],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.local_cafe, color: latte, size: 36),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Kopi Nusantara',
                  style: TextStyle(
                    color: cream,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Katalog kopi Indonesia',
                  style: TextStyle(
                    color: cream.withValues(alpha: 0.78),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Text(
                    'Versi 0.1.0',
                    style: TextStyle(
                      color: latte,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Tentang Aplikasi'),
          const SizedBox(height: 8),
          const Text(
            'Kopi Nusantara adalah katalog statis yang memperkenalkan biji kopi dari berbagai daerah Indonesia: karakter rasa, asal, tautan info biji, dan cara menyeduhnya. Fitur Temukan Kopimu membantu memilih kopi sesuai selera. Aplikasi ini dibuat untuk tugas UTS Mobile Programming.',
            style: TextStyle(fontSize: 14.5, height: 1.65, color: coffeeDark),
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Pembuat'),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: cardCream,
              border: Border.all(color: creamDark),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: coffeeBrown,
                  child: Icon(Icons.person_outline, color: cream, size: 28),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ghofurm',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Mahasiswa Teknik Informatika',
                        style: TextStyle(fontSize: 13, color: coffeeMedium),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Penyusun aplikasi Kopi Nusantara',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Kontak & Media Sosial'),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: cardCream,
              border: Border.all(color: creamDark),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                _ContactRow(
                  icon: Icons.mail_outline,
                  label: 'Email',
                  value: 'halo@kopinusantara.id',
                ),
                _ContactDivider(),
                _ContactRow(
                  icon: Icons.camera_alt_outlined,
                  label: 'Instagram',
                  value: '@kopinusantara',
                ),
                _ContactDivider(),
                _ContactRow(
                  icon: Icons.code,
                  label: 'GitHub',
                  value: 'github.com/Ghofurm',
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          FilledButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Kembali ke Beranda'),
            style: FilledButton.styleFrom(
              backgroundColor: coffeeBrown,
              foregroundColor: cream,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              'Dibuat dengan Flutter • 2026',
              style: TextStyle(fontSize: 12, color: coffeeMedium),
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

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: creamDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: coffeeBrown),
          ),
          const SizedBox(width: 12),
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
                  style: const TextStyle(
                    fontSize: 13.5,
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

class _ContactDivider extends StatelessWidget {
  const _ContactDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, thickness: 1, color: creamDark);
  }
}
