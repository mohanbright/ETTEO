import 'package:meta/meta.dart';
@immutable
abstract class AuthenticationState {}

class InitialAuthenticationState extends AuthenticationState {}

class Authenticated extends AuthenticationState {}

class Authenticating extends AuthenticationState {}

class AuthenticationFailed extends AuthenticationState {
  final String error;

  AuthenticationFailed({@required this.error});
}

class AuthenticationAccessRevoked extends AuthenticationState {}
