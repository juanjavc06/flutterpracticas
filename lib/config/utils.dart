
import 'package:flutter/material.dart';

BoxShadow boxShadowFromElevation(double elevation) {
  return BoxShadow(
    color: Colors.black.withOpacity(0.24),
    blurRadius: elevation * 1.5,
    spreadRadius: 0.0,
    offset: Offset(0, elevation * 0.5),
  );
}