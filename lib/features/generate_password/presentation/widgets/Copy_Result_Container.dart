import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/const/constants.dart';
import 'package:password_generator/features/generate_password/presentation/bloc/password_generate_bloc.dart';

class CopyResultContainer extends StatefulWidget {
  const CopyResultContainer({super.key});

  @override
  State<CopyResultContainer> createState() => _CopyResultContainerState();
}

class _CopyResultContainerState extends State<CopyResultContainer> {
  bool isCopy = false;
  Color borderColor = bgColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordGenerateBloc, PasswordGenerateState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding),
            color: borderColor,
          ),
          child: TextField(
            controller: state.passwordController,
            readOnly: true,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: primaryColor),
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.copy,
                size: Theme.of(context).textTheme.titleLarge!.fontSize,
              ),
            ),
            onTap: () {
              Clipboard.setData(
                  ClipboardData(text: state.passwordController.text));
              setState(() => borderColor = primaryColor);
              Timer(const Duration(milliseconds: 300),
                  () => setState(() => borderColor = bgColor));
            },
          ),
        );
      },
    );
  }
}
