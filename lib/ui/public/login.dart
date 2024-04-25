import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test/model/user.dart';
import 'package:test/providers/user_provider.dart';
import '../../controllers/auth_controller.dart';

class TestRoute extends StatelessWidget {
  String title;

  TestRoute({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 300,
      child: Text("NUEVA RUTA"),
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

  GlobalKey<FormState> formulario = GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  AuthController _authController = AuthController();

  void onSubmit() {
    showModalBottomSheet(
      context: context,
      builder: (context) {

        return TestRoute(title: "TEST",);
      },
    );

    Navigator.pushNamed(context, '');
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return TestRoute(
    //     title: "TEST ROUTE 2",
    //   );
    // }));

    if (formulario.currentState!.validate()) {

      setState(() {
        _isLoading = true;
      });
      _authController.login(_username.text, _password.text)
        .then((User user) {

          final userProvider = Provider.of<UserProvider>(context, listen: false) ;
          userProvider.setUser = user;
setState(() {
        _isLoading = false;
      });
        })
        .catchError((e) {
        print("ERROR AL PROCESAR");
        print(e);
        return e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formulario,
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nombre de usuario",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) return "Debe escribir algo";
                    if (value.length > 8) return "El usuario no puede ser mayor a 8 caracteres";
                    return null;
                  },
                  controller: _username,
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                  ),
                  obscureText: true,
                ),
                ElevatedButton(onPressed: onSubmit, child: Text("GUARDAR"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
