import 'package:flutter/material.dart';

Widget makeCategory({isActive, title}) {
  return AspectRatio(
    aspectRatio: isActive ? 3 : 2.5 / 1,
    child: Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isActive ? Colors.yellow[700] : Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Align(
        child: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[500],
              fontSize: 18,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
        ),
      ),
    ),
  );
}
