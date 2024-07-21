import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Icon(
        icon,
        size: 28,
      ),
    );
  }
}
