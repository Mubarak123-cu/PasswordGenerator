import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:password_generator/features/generate_password/domain/entities/password_settings.dart';
import 'package:password_generator/features/generate_password/domain/use_cases/password_use_case.dart';

part 'password_generate_state.dart';
part 'password_generate_event.dart';

class PasswordGenerateBloc
    extends Bloc<PasswordGenerateEvent, PasswordGenerateState> {
  final PasswordUseCase passwordUseCase;
  PasswordGenerateBloc(this.passwordUseCase)
      : super(PasswordGenerateState.initial()) {
    on<ChangePasswordLengthEvent>((event, emit) {
      emit(state.copyWith(passwordLength: event.passwordLength));
    });
    on<ChangeLowercaseEvent>((event, emit) {
      if (!state.isLowercase ||
          state.isLowercase && state.isUppercase ||
          state.isLowercase && state.isNumbers ||
          state.isLowercase && state.isSymbols) {
        emit(state.copyWith(isLowercase: !state.isLowercase));
      }
    });
    on<ChangeUppercaseEvent>((event, emit) {
      if (!state.isUppercase ||
          state.isUppercase && state.isLowercase ||
          state.isUppercase && state.isNumbers ||
          state.isUppercase && state.isSymbols) {
        emit(state.copyWith(isUppercase: !state.isUppercase));
      }
    });

    on<ChangeNumbersEvent>((event, emit) {
      if (!state.isNumbers ||
          state.isNumbers && state.isLowercase ||
          state.isNumbers && state.isUppercase ||
          state.isNumbers && state.isSymbols) {
        emit(state.copyWith(isNumbers: !state.isNumbers));
      }
    });
    on<ChangeSymbolsEvent>((event, emit) {
      if (!state.isSymbols ||
          state.isSymbols && state.isLowercase ||
          state.isSymbols && state.isUppercase ||
          state.isSymbols && state.isNumbers) {
        emit(state.copyWith(isSymbols: !state.isSymbols));
      }
    });
    on<ChangeExcludeDuplicateEvent>((event, emit) {
      emit(state.copyWith(isExcludeDuplicate: !state.isExcludeDuplicate));
    });
    on<ChangeIncludeSpacesEvent>((event, emit) {
      emit(state.copyWith(isIncludeSpaces: !state.isIncludeSpaces));
    });

    on<ChangeEvent>((event, emit) {
      final max = getMaxPasswordLength(state);
      emit(state.copyWith(
        passwordLength: state.passwordLength > max ? max : state.passwordLength,
        maxPasswordLength: max,
      ));
    });
    on<GeneratePasswordSubmittedEvent>((event, emit) {
      var params = PasswordSettings(
        passwordLength: state.passwordLength,
        withLowercase: state.isLowercase,
        withUppercase: state.isUppercase,
        withSymbols: state.isSymbols,
        withNumbers: state.isNumbers,
        excludeDuplicate: state.isExcludeDuplicate,
        includeSpaces: state.isIncludeSpaces,
      );
      var randomPassword = passwordUseCase.call(params);
      emit(state.copyWith(
        passwod: randomPassword,));
    });
  }
}

int getMaxPasswordLength(PasswordGenerateState state) {
  var maxPasswordLength = 0;
  if (state.isLowercase) maxPasswordLength += 26;
  if (state.isUppercase) maxPasswordLength += 26;
  if (state.isNumbers) maxPasswordLength += 10;
  if (state.isSymbols) maxPasswordLength += 23;
  if (state.isIncludeSpaces) maxPasswordLength += 2;
  return maxPasswordLength;
}
