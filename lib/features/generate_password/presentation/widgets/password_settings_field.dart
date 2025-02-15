import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/features/generate_password/presentation/bloc/password_generate_bloc.dart';
import 'package:password_generator/features/generate_password/presentation/widgets/Coustom_Check_Box.dart';

class PasswordSettingsField extends StatelessWidget {
  const PasswordSettingsField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Password Settings",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        BlocBuilder<PasswordGenerateBloc, PasswordGenerateState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CoustomCheckBox(
                        label: "Lowercase (a-z)",
                        value: state.isLowercase,
                        onChanged: () => context
                            .read<PasswordGenerateBloc>()
                            .add(ChangeLowercaseEvent()),
                      ),
                      CoustomCheckBox(
                        label: "numbers (0-9)",
                        value: state.isNumbers,
                        onChanged: () => context
                            .read<PasswordGenerateBloc>()
                            .add(ChangeNumbersEvent()),
                      ),
                      CoustomCheckBox(
                        label: "Exclude Duplicate",
                        value: state.isExcludeDuplicate,
                        onChanged: () => context
                            .read<PasswordGenerateBloc>()
                            .add(ChangeExcludeDuplicateEvent()),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CoustomCheckBox(
                        label: "Uppercase (A-Z)",
                        value: state.isUppercase,
                        onChanged: () => context
                            .read<PasswordGenerateBloc>()
                            .add(ChangeUppercaseEvent()),
                      ),
                      CoustomCheckBox(
                        label: "Symbols (!-\$^+)",
                        value: state.isSymbols,
                        onChanged: () => context
                            .read<PasswordGenerateBloc>()
                            .add(ChangeSymbolsEvent()),
                      ),
                      CoustomCheckBox(
                        label: "Include Space",
                        value: state.isIncludeSpaces,
                        onChanged: () => context
                            .read<PasswordGenerateBloc>()
                            .add(ChangeIncludeSpacesEvent()),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
