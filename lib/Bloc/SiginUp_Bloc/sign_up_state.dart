part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
class SignUBlocLoading extends  SignUpState {}
class SignUBlocLoaded extends  SignUpState {}
class SignUBlocError extends  SignUpState {}