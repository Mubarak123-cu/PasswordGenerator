import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/const/constants.dart';
import 'package:password_generator/features/generate_password/data/local/password_generator.dart';
import 'package:password_generator/features/generate_password/data/repositories/password_repo_impl.dart';
import 'package:password_generator/features/generate_password/domain/use_cases/password_use_case.dart';
import 'package:password_generator/features/generate_password/presentation/bloc/password_generate_bloc.dart';
import 'package:password_generator/features/generate_password/presentation/widgets/Copy_Result_Container.dart';
import 'package:password_generator/features/generate_password/presentation/widgets/Password_Button.dart';
import 'package:password_generator/features/generate_password/presentation/widgets/header.dart';
import 'package:password_generator/features/generate_password/presentation/widgets/password_length.dart';
import 'package:password_generator/features/generate_password/presentation/widgets/password_settings_field.dart';

class PasswordGeneratePage extends StatelessWidget {
  const PasswordGeneratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PasswordGenerateBloc(
            PasswordUseCase(PasswordRepoImpl(PasswordGenerator()))),
        child: _PasswordGenratorPage());
  }
}

class _PasswordGenratorPage extends StatelessWidget {
  const _PasswordGenratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            PasswordLength(),
            PasswordSettingsField(),
            CopyResultContainer(),
            PasswordButton(),
          ],
        ),
      )),
    );
  }
}
