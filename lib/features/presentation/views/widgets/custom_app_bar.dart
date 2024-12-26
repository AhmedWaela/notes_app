import 'package:flutter/material.dart';
import 'package:notes_app/features/presentation/views/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.iconData, this.onTap});
  final String title;
  final IconData iconData;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        CustomSearchIcon(
          onTap: onTap,
          iconData: iconData,
        )
      ],
    );
  }
}
