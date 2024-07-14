import 'package:flutter/material.dart';

import 'custom_icon.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.iconData, this.onPressed});
  final String title;
  final IconData iconData;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(title,style: TextStyle(color: Colors.white),),
        Spacer(),
        CustomIcon(iconData: iconData,onPresed: onPressed ,)
      ],
    );
  }
}


