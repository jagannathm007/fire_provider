import 'package:fire_provider/providers/authentication_provider.dart';
import 'package:fire_provider/screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final authentication = Provider.of<Authentication>(context, listen: false);
      authentication.onClearRegisterFields();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Authentication authentication = Provider.of<Authentication>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: LoadingScreen(
        isLoading: authentication.isLoading,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          children: [
            TextFormField(
              controller: authentication.txtName,
              decoration: const InputDecoration(hintText: "Your name"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: authentication.txtEmail,
              decoration: const InputDecoration(hintText: "Email address"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: authentication.txtMobile,
              decoration: const InputDecoration(hintText: "Mobile number"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: authentication.txtPassword,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () async => await authentication.onCreateAccount(context),
              color: Colors.orange,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Text("Create account"),
            )
          ],
        ),
      ),
    );
  }
}
