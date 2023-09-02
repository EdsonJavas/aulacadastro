import 'package:flutter/material.dart';

class Alerta extends StatefulWidget {
  final TextEditingController controllerName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerBirth;
  final TextEditingController controllerPhone;

  const Alerta({
    super.key,
    required this.controllerName,
    required this.controllerEmail,
    required this.controllerBirth,
    required this.controllerPhone,
  });

  @override
  State<Alerta> createState() => _AlertaState();
}

class _AlertaState extends State<Alerta> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Atenção'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Confira se seus dados estão corretos e clique em Ok',
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 40),
          const Text('seu Nome: '),
          Text(widget.controllerName.text),
          const SizedBox(height: 40),
          const Text('seu Email: '),
          Text(widget.controllerEmail.text),
          const SizedBox(height: 40),
          const Text('sua Data de Nascimento: '),
          Text(widget.controllerBirth.text),
          const SizedBox(height: 40),
          const Text('seu Telefone: '),
          Text(widget.controllerPhone.text),
          const SizedBox(height: 40),
          const Text(
            'Assim que clicar em "Cadastrar" já estará cadastrado em nosso contador',
            textAlign: TextAlign.left,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            widget.controllerName.text = '';
            widget.controllerPhone.text = '';
            widget.controllerEmail.text = '';
            widget.controllerBirth.text = '';
            Navigator.pop(context);
          },
          child: const Text('Cadastrar'),
        ),
        const Spacer(),
      ],
    );
  }
}
