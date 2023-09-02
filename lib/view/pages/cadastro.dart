// ignore_for_file: directives_ordering, unnecessary_null_comparison, prefer_single_quotes, no_leading_underscores_for_local_identifiers, avoid_returning_null_for_void
import 'package:contador/view/pages/mixin_validadtor.dart';
import 'package:contador/view/pages/tela_inicial.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> with validatorMixin {
  @override
  Widget build(BuildContext context) {
    final controllerName = TextEditingController();
    final controllerEmail = TextEditingController();
    final controllerBirth = TextEditingController();
    final controllerPhone = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        backgroundColor: Colors.black,
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Cadastre-se ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                  TextSpan(
                    text: 'no nosso contador',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      validator: isNotEmpyt,
                      controller: controllerName,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: isNotEmpyt,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'Ops! Parece que não tem nada aqui';
                        }
                        return null;
                      },
                      controller: controllerBirth,
                      decoration: InputDecoration(
                        labelText: 'Nascimento',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      validator: (value) => combine([
                        () => isNotEmpyt(value),
                        () => hasOnzeCaracteres(value),
                      ]),
                      controller: controllerPhone,
                      decoration: InputDecoration(
                        labelText: 'Telefone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 0, 0),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const TelaInicial(),
                      ),
                    );

                    // showDialog<void>(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return Alerta(
                    //       controllerName: controllerName,
                    //       controllerEmail: controllerEmail,
                    //       controllerBirth: controllerBirth,
                    //       controllerPhone: controllerPhone,
                    //     );
                    //   },
                    // );
                  }
                  return null;
                },
                child: const Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
