import 'package:fire_provider/core/routes.dart';
import 'package:fire_provider/firebase_options.dart';
import 'package:fire_provider/providers/authentication_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<Authentication>(create: (context) => Authentication())],
      child: MaterialApp(
        title: "fire_provider",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
