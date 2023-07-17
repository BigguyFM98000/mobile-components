import 'package:flutter/material.dart';

class AdvancedTile {
  final String title;
  final IconData icon;
  final List<AdvancedTile> tiles;
  final bool isExpanded;

  AdvancedTile({
    required this.title,
    this.icon = Icons.phone_android_outlined,
    this.tiles = const [],
    this.isExpanded = false,
  });
}
