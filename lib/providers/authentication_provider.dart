import 'package:flutter/material.dart';
import 'package:fire_provider/models/user.dart';
import 'package:fire_provider/core/toast_helper.dart';
import 'package:fire_provider/services/auth_service.dart';

class Authentication extends ChangeNotifier {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  onClearRegisterFields() {
    txtName.text = "";
    txtEmail.text = "";
    txtMobile.text = "";
    txtPassword.text = "";
    isLoading = false;
    notifyListeners();
  }

  bool isLoading = false;
  onCreateAccount(BuildContext context) async {
    User user = User(
      name: txtName.text,
      email: txtEmail.text,
      mobile: txtMobile.text,
      password: txtPassword.text,
    );
    isLoading = true;
    notifyListeners();
    var response = await AuthService().register(user);
    if (response != null) {
      if (response.type == "success") {
        ToastHelper.success(response.message);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      } else {
        ToastHelper.warning(response.message);
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
