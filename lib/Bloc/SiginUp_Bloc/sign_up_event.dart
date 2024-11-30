part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}
class FeatchSignUp extends SignUpEvent{
  final String name;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;
  FeatchSignUp({ required this.name,required this.email,required this.state,required this.password,required this.city,required this.locality, });
}
