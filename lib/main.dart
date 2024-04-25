import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/ui/public/login.dart';
import './providers/user_provider.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            //Aquí va el tema
          ),
          routes: {
            "cliente/dashboard": (context) => Container(),
            "cliente/transacciones": (context) => Container(),
            "cliente/finanzas": (context) => Container(),
            "cliente/usuarios": (context) => Container(),
          },
          home: LoginForm(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
