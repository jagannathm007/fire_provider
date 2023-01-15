import 'package:fire_provider/core/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.local_fire_department_rounded),
            Text("Fire provider")
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.register);
            },
            child: const Text("Register"),
          )
        ],
      ),
    );
  }
}
