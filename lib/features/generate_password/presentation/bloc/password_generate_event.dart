part of 'password_generate_bloc.dart';

abstract class PasswordGenerateEvent {}

class ChangeEvent extends PasswordGenerateEvent {}

class ChangePasswordLengthEvent extends ChangeEvent {
  final int passwordLength;
  ChangePasswordLengthEvent({required this.passwordLength});
}

class ChangeLowercaseEvent extends ChangeEvent {}

class ChangeUppercaseEvent extends ChangeEvent {}

class ChangeNumbersEvent extends ChangeEvent {}

class ChangeSymbolsEvent extends ChangeEvent {}

class ChangeExcludeDuplicateEvent extends ChangeEvent {}

class ChangeIncludeSpacesEvent extends ChangeEvent {}

class GeneratePasswordSubmittedEvent extends ChangeEvent {}
