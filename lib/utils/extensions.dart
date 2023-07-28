extension StringExtension on String {
  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidTitle {
    final titleRegExp = RegExp(r"^[a-zA-Z0-9]*$");
    return titleRegExp.hasMatch(this);
  }

  bool get isValidMessage {
    final messageRegExp =
        RegExp(r"^[a-zA-Z0-9~!@#$%^&*()`\[\]{};':,.\/<>?| ]*$");
    return messageRegExp.hasMatch(this);
  }

  // bool get isValidDateTime {}
}
