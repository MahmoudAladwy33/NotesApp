import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: 47,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: 30,
        ),
      ),
    );
  }
}
