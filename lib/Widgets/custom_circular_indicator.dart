import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          color: Colors.black,
        ));
  }
}
