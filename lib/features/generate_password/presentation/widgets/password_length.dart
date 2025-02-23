import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/const/constants.dart';
import 'package:password_generator/features/generate_password/presentation/bloc/password_generate_bloc.dart';

class PasswordLength extends StatelessWidget {
  const PasswordLength({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordGenerateBloc, PasswordGenerateState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              "Password Length",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTickMarkColor: Colors.transparent,
                inactiveTickMarkColor: Colors.transparent,
                thumbColor: primaryColor,
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 1),
              ),
              child: Slider(
                min: 6,
                max: state.maxPasswordLength.toDouble(),
                value: state.passwordLength.toDouble(),
                onChanged: (value) => context.read<PasswordGenerateBloc>().add(
                    ChangePasswordLengthEvent(passwordLength: value.toInt())),
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: primaryColor.withOpacity(0.25)),
                  borderRadius: BorderRadius.circular(defaultPadding)),
              child: Center(
                child: Text(
                  state.passwordLength.toString(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
