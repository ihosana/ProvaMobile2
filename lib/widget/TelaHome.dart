/*
import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/contato.dart';
import 'package:segunda_prova/helpers/contato_metodos.dart';
import 'package:segunda_prova/telas/cadastro.dart';
import 'package:segunda_prova/widget/cardContatos.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contatos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          labelLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      home: Lista(),
    );
  }
}

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  TelaCadastro()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



class getListView extends StatelessWidget {
  final contato = ContatoMetodo();
  late Future<List> contatos;

 @override
  void initState() {
    // TODO: implement initState
  
    contatos = contato.getAll();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: 2,
    itemBuilder: (context,i)=>CardContatos(nome: "iho", sobrenome: "sobrenome", numero: "numero"),
    );
  
  }
  
}

*/
import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/contato.dart';
import 'package:segunda_prova/helpers/contato_metodos.dart';
import 'package:segunda_prova/telas/cadastro.dart';
import 'package:segunda_prova/widget/cardContatos.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contatos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          labelLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      home: const Lista(),
    );
  }
}

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaCadastro()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body:  const CardContatos(
            nome: "Rodrigo",
            sobrenome: "Pacheco",
            numero:"554684"),
       
      //const ListBody(),
    );
  }
}

class ListBody extends StatefulWidget {
  const ListBody({super.key});

  @override
  State<ListBody> createState() => _ListBodyState();
}

class _ListBodyState extends State<ListBody> {
  final contatoM = ContatoMetodo();
  late Future<List> contatos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contatos = contatoM.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: contatos,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) => ListItem(contato: snapshot.data![i]),
              )
            : const Center(child: Text("Nenhum contato adicionado"));
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final Contato contato;
  const ListItem({super.key, required this.contato});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Single Tap"),
        ));
      },
      onLongPress: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Long Press"),
        ));
      },
      child: CardContatos(
          nome: contato.nome,
          sobrenome: contato.sobrenome,
          numero: contato.numeroContato.toString()),
    );
    ;
  }
}