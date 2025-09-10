import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final DBHelper dbHelper = DBHelper();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    var user = await dbHelper.getUser(email, password);

    if (user != null) {
      Fluttertoast.showToast(msg: "Bienvenido, ${user['name']}!");
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Fluttertoast.showToast(msg: "Correo o contraseña incorrectos.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text('Iniciar sesión'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
