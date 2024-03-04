import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  final String text;
  final Color? color;
  const Tasks({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 131, 131),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: color,
          ),
        ),
      ),
    );
  }
}
