class AuthenticationMethods {
  Future<String> signUpUser({
    required String name,
    required String address,
    required String email,
    required String password,
  }) async {
    String output = "Something went wrong";
    if (name.isNotEmpty &&
        address.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      output = "success";
    } else {
      output = "Please fill up everything";
    }
    return output;
  }
}
