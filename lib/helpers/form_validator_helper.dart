import 'package:form_validator/form_validator.dart';

class FormValidatorHelper {
  static emailValidator() {
    return ValidationBuilder().required().email().maxLength(50).build();
  }

  static passwordValidator() {
    return ValidationBuilder().minLength(8).maxLength(20).build();
  }

  static confirmPasswordValidator(password, confirmPassword) {
    if (password != confirmPassword) {
      return "Password and confirm password is not match";
    } else {
      passwordValidator();
    }
  }
}
