import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final DBHelper dbHelper = DBHelper();

  void register() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (await dbHelper.emailExists(email)) {
      Fluttertoast.showToast(msg: "El correo ya está registrado.");
      return;
    }

    await dbHelper.insertUser({
      'name': name,
      'email': email,
      'password': password,
    });
    Fluttertoast.showToast(msg: "Registro exitoso!");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
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
            ElevatedButton(onPressed: register, child: const Text('Registrar')),
          ],
        ),
      ),
    );
  }
}
