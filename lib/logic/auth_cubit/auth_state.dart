part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}


class RegisterLoadingState extends AuthState {}
class RegisterSuccessState extends AuthState {}
class RegisterErrorState extends AuthState {}


class LoginLoading extends AuthState{}
class LoginSuccess extends AuthState{}
class LoginError extends AuthState{}