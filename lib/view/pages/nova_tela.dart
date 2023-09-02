// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Novatela extends StatelessWidget {
  const Novatela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            );
          },
        ),
        backgroundColor: Colors.black,
        title: const Text('Sobre'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Vai Corinthians',
          style: TextStyle(
            fontSize: 40,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
