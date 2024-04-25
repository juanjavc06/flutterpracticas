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
            fontFamily: "Inter",
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(100, 24, 195, 1),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              filled: true,
              fillColor: Color.fromRGBO(0, 0, 0, 0.04),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(100, 24, 195, 1), width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
            useMaterial3: true,
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
