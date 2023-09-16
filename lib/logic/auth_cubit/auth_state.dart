part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  String token;
  String uId;
  LoginSuccess({required this.token, required this.uId});
}

class LoginError extends AuthState {}
