class AppValidator{
  
  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length != 11) {
      return 'Please enter a 11-digit phone number';
    }
    return null;
  }

  String? validateUsername(value) {
    if (value!.isEmpty) {
      return 'Please enter an username';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  String? isEmptyCheck(value) {
    if (value!.isEmpty) {
      return 'Please fill the form';
    }
    return null;
  }

}