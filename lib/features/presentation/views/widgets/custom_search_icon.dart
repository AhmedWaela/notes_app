import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.iconData, this.onTap});
  final IconData iconData;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
        ),
        height: 46,
        width: 46,
        child: Center(
          child: Icon(
            iconData,
            size: 28,
          ),
        ),
      ),
    );
  }
}
