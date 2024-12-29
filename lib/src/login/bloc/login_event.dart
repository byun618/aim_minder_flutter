class LoginButtonPressedEvent extends LoginEvent {
  const LoginButtonPressedEvent();
}

class LoginEmailChangeEvent extends LoginEvent {
  final String email;

  const LoginEmailChangeEvent({required this.email});
}

class LoginPasswordChangedEvent extends LoginEvent {
  const LoginPasswordChangedEvent({required this.password});

  final String password;
}

abstract class LoginEvent {
  const LoginEvent();
}
