import 'package:flutter/material.dart';

class FloatingNavbarItem {
  final IconData? icon;
  final Widget? customWidget;

  FloatingNavbarItem({
    this.icon,
    this.customWidget,
  }) : assert(icon != null || customWidget != null);
}
