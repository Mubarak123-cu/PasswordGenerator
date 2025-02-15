import 'package:flutter/material.dart';
import 'package:password_generator/core/const/constants.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      "Password Generator",
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontWeight: FontWeight.bold),
      gradientType: GradientType.linear,
      gradientDirection: GradientDirection.ttb,
      radius: 1,
      colors: const [primaryColor, Colors.white],
    );
  }
}
