
class Contato {
  static const String tabelaContatos = "tableC";
  static const String idColuna = "id";
  static const String nomeColuna = "nome";
  static const String sobrenomeColuna = "sobrenome";
  static const String numeroColuna = "numeroContato";
  static const String emailColuna = "email";
  static const String enderecoColuna = "endereco";
  static const String paisColuna = "pais";

  int id = 0;
  String nome = 'ihosana';
  String sobrenome = 'assis';
  int numeroContato = 0;
  String email = '';
  String endereco = '';
  String pais = '';

  Contato(this.nome, this.sobrenome, this.numeroContato, this.email,
      this.endereco, this.pais);

  Contato.fromMap(Map map) {
    id = map[idColuna];
    nome = map[nomeColuna];
    sobrenome = map[sobrenomeColuna];
    numeroContato = map[numeroColuna];
    email = map[emailColuna];
    endereco = map[enderecoColuna];
    pais = map[paisColuna];
  }

  Map<String, dynamic> toMap() {
    return {
      nomeColuna: nome,
      sobrenomeColuna: sobrenome,
      numeroColuna: numeroContato,
      emailColuna: email,
      enderecoColuna: endereco,
      paisColuna: pais
    };
  }

  @override
  String toString() {
    return 'Contato{nome: $nome, sobrenome: $sobrenome, numeroContato: $numeroContato, email:$email, endereco:$endereco, pais:$pais}';
  }
}