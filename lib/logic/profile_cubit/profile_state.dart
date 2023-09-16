part of 'profile_cubit.dart';


abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class GetProfileLoading extends ProfileState {}
class GetProfileSuccess extends ProfileState {}
class GetProfileError extends ProfileState {}

class GetAllUserLoading extends ProfileState {}
class GetAllUserSuccess extends ProfileState {}
class GetAllUserError extends ProfileState {}



