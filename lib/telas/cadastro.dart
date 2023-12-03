import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/contato.dart';
import 'package:segunda_prova/helpers/contato_metodos.dart';
import 'package:segunda_prova/widget/TelaHome.dart';
import 'package:segunda_prova/widget/formCustom.dart';

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Cadastrar Contatos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const FormContatoBody(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

class FormContatoBody extends StatefulWidget {
  const FormContatoBody({
    super.key,
  });

  @override
  State<FormContatoBody> createState() => _FormContatoBodyState();
}

class _FormContatoBodyState extends State<FormContatoBody> {
  final _formKey = GlobalKey<FormState>();

  final nome = TextEditingController();
  final sobrenome = TextEditingController();
  final numero = TextEditingController();
  final email = TextEditingController();
  final endereco = TextEditingController();
  final pais = TextEditingController();

  final contato = ContatoMetodo();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Cadastro de Contatos",
              style: Theme.of(context).textTheme.displaySmall,
              
              
            ),
            FormCustom(
              controller: nome,
              labelText: "Nome",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione um nome';
                }
                return null;
              },
            ),
            FormCustom(
              controller: sobrenome,
              labelText: "Sobrenome",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione um Sobrenome';
                }
                return null;
              },
            ),
            FormCustom(
              controller: numero,
              labelText: "Numero",
              keyboard_type: TextInputType.number,
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione um numero';
                }
                return null;
              },
            ),
              FormCustom(
              controller: email,
              labelText: "Email",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione um email';
                }
                return null;
              },
            ),
              FormCustom(
              controller: endereco,
              labelText: "Endereco",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione um endereço';
                }
                return null;
              },
            ),
              FormCustom(
              controller: pais,
              labelText: "País",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione um país';
                }
                return null;
              },
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Contato c = Contato(nome.text, sobrenome.text,
                      int.parse(numero.text), email.text, endereco.text, pais.text);
                  contato.saveContato(c);
                  Navigator.pop(context);}
              },
              style: TextButton.styleFrom(
               backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
              ),
              child: Text(
                "Cadastrar",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//const Center(child:Text("Cadastro"))