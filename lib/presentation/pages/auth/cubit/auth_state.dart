part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

// Auth Login State //

class LogInLoadingState extends AuthState{}
class LogInSuccessState extends AuthState{}
class LogInErrorState extends AuthState{
  String error;
  LogInErrorState({
    required this.error
  });
}