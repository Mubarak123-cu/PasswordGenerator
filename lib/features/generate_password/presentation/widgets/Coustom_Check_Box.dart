import 'package:flutter/material.dart';
import 'package:password_generator/core/const/constants.dart';

class CoustomCheckBox extends StatelessWidget {
  final String label;
  final bool value;
  final VoidCallback onChanged;
  const CoustomCheckBox(
      {super.key,
      required this.label,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding / 4),
      child: InkWell(
        onTap: onChanged,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: primaryColor.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(defaultPadding / 2),
          ),
          child: Wrap(
            children: [
              const SizedBox(
                width: defaultPadding / 2,
              ),
              Icon(
                value ? Icons.check_box : Icons.check_box_outline_blank,
                size: Theme.of(context).textTheme.titleLarge!.fontSize,
              ),
              const SizedBox(
                width: defaultPadding / 2,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
