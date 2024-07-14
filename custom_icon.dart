import 'package:flutter/material.dart';


class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.iconData, this.onPresed});
  final IconData iconData;
  final Function()? onPresed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.05),
      ),
      child:  Center(
        child: IconButton(onPressed:  onPresed ,icon :Icon(iconData)),
      ),
    );
  }
}