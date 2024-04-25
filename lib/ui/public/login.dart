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
    ThemeData themeData = Theme.of(context);

    MediaQueryData media = MediaQuery.of(context);

    List<Widget> options = [
      const Text("¿Olvidaste tu contraseña?"),
      GestureDetector(
        child: const Text(
          "Restaurar Aquí",
          style: TextStyle(color: Color.fromRGBO(100, 24, 195, 1), decoration: TextDecoration.underline),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(100, 24, 195, 1),
      body: Form(
        key: formulario,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Card(
              // color: Color.fromRGBO(255, 255, 255, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                child: //Text("ASDASD")
                    Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Bienvenido de Nuevo',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Por favor, ingresa tus credenciales para iniciar sesión',
                        style: TextStyle(
                          fontSize: 16.0,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: const Text(
                        'CORREO ELECTRONICO',
                        style: TextStyle(
                          // C7C7C7
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _username,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) return "Debe escribir algo";
                        if (value.length > 8) return "El usuario no puede ser mayor a 8 caracteres";
                        return null;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        // labelText: "sdfasdf"
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: const Text(
                        'CONTRASEÑA',
                        style: TextStyle(
                          // C7C7C7
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() => _showPassword = !_showPassword),
                          child: Icon(color: themeData.primaryColor, _showPassword ? Entypo.eye : Entypo.eye_with_line),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                          // color: themeData.primaryColor,
                          decoration: BoxDecoration(
                              color: themeData.primaryColor, boxShadow: [boxShadowFromElevation(2)], borderRadius: BorderRadius.circular(8)),
                          child: const Text(
                            "INICIAR SESIÓN",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (media.size.width > 360)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: options,
                      )
                    else
                      Column(
                        children: options,
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                          // color: themeData.primaryColor,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(227, 40, 175, 1),
                            boxShadow: [boxShadowFromElevation(2)],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "CREAR UNA CUENTA",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  
  }
}
