import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla Principal')),
      body: const Center(
        child: Text(
          '¡Has iniciado sesión correctamente!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
