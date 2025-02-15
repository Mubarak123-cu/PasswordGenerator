import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/const/constants.dart';
import 'package:password_generator/features/generate_password/presentation/bloc/password_generate_bloc.dart';

class PasswordButton extends StatelessWidget {
  const PasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .read<PasswordGenerateBloc>()
          .add(GeneratePasswordSubmittedEvent()),
      child: Container(
        margin: const EdgeInsets.all(defaultPadding),
        padding: const EdgeInsets.all(defaultPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          gradient: const LinearGradient(
            colors: [primaryColor, bgColor],
          ),
          boxShadow: const [
            BoxShadow(
              color: primaryColor,
              offset: Offset(-2, 0),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Text(
          "GENERATE PASSWORD",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
