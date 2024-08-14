import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon});

  final IconData icon;
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
          onPressed: () {},
          icon:  Icon(icon),
          iconSize: 30,
        ),
      ),
    );
  }
}
