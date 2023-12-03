import 'package:flutter/material.dart';

class CardContatos extends StatelessWidget {
    final String nome, sobrenome,numero;

  const CardContatos({
    super.key, required this.nome, required this.sobrenome, required this.numero
  });

  @override
  Widget build(BuildContext context) {
    return  Card( 
              child: ListTile(
                leading: const Icon(Icons.person_3_rounded),
                
                title: Text(nome +sobrenome),
                subtitle: Text(numero),
               trailing: const Icon(Icons.phone),
              ),
          );
      
}
}


