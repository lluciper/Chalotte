part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class LoginWithUserNamePassWord extends LoginEvent {
  const LoginWithUserNamePassWord(
    this.context, {
    this.userName = '',
    this.password = '',
  });

  final String userName, password;
  final BuildContext context;

  @override
  List<Object?> get props => [userName, password];
}
