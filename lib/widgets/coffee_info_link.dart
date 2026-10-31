import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class CoffeeInfoLink extends StatelessWidget {
  const CoffeeInfoLink({super.key, required this.url, this.prominent = false});

  final String url;
  final bool prominent;

  Future<void> _open(BuildContext context) async {
    var launched = false;
    try {
      launched = await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      launched = false;
    }
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tautan info biji kopi tidak dapat dibuka.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.open_in_new,
          size: prominent ? 15 : 14,
          color: prominent ? latte : coffeeBrown,
        ),
        SizedBox(width: prominent ? 6 : 4),
        Text(
          'Info biji kopi',
          style: TextStyle(
            fontSize: prominent ? 13 : 12.5,
            fontWeight: FontWeight.w600,
            color: prominent ? cream : coffeeBrown,
          ),
        ),
      ],
    );

    if (prominent) {
      return Material(
        color: coffeeDark,
        borderRadius: BorderRadius.circular(999),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _open(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            child: content,
          ),
        ),
      );
    }

    return InkWell(
      onTap: () => _open(context),
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: content,
      ),
    );
  }
}
