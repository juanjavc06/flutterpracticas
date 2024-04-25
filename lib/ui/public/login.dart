import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/src/entypo.dart';
import 'package:provider/provider.dart';
import 'package:test/model/user.dart';
import 'package:test/providers/user_provider.dart';
import 'package:test/controllers/auth_controller.dart';
import 'package:test/config/utils.dart';

class TestRoute extends StatelessWidget {
  String title;

  TestRoute({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 300,
      child: const Text("NUEVA RUTA"),
    );
  }
}

class LoginForm extends StatefulWidget {
  String title;

  LoginForm({required this.title});

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isLoading = false;
  bool _showPassword = false;

  GlobalKey<FormState> formulario = GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  AuthController _authController = AuthController();

  void onSubmit() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return TestRoute(
          title: "TEST",
        );
      },
    );

    Navigator.pushNamed(context, '');

    if (formulario.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _authController.login(_username.text, _password.text).then((User user) {
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser = user;
        setState(() {
          _isLoading = false;
        });
      }).catchError((e) {
        print("ERROR AL PROCESAR");
        print(e);
        return e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromRGBO(100, 24, 195, 1),
      body: Container(
        //Aquí va el formulario
      )    
    );
  
  }
}
