class FormValidator {
  final String? email;

  FormValidator({this.email});

  String? emailValidator(String? value) {
    if (value == null) {
      print('validateddd');
      return 'please enter a valid email';
    } else {
      print('validateddd');
      return 'good one!';
    }
  }

  String? passwordValidator(String? value) {
    if (value == null) {
      return 'please enter a valid password';
    } else {
      return 'good one!';
    }
  }

  String? usernameValidator(String? value) {
    if (value == null) {
      return 'please enter a valid username with no space';
    } else {
      return 'good one!';
    }
  }
}
