// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class Usuario {
  int? id;
  String? nome;
  String? email;
  String? dtCadastro;
  String? dtAtualizacao;

  Usuario(
      {this.id, this.nome, this.email, this.dtCadastro, this.dtAtualizacao});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    dtCadastro = json['dtCadastro'];
    dtAtualizacao = json['dtAtualizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['dtCadastro'] = this.dtCadastro;
    data['dtAtualizacao'] = this.dtAtualizacao;
    return data;
  }
}
