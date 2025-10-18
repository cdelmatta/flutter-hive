import 'package:flutter/material.dart';
import '../data/models/livro.dart';
import '../data/repositories/livro_repository.dart';

class LivroTile extends StatelessWidget{
  final Livro livro;
  final repo = LivroRepository();

  LivroTile({super.key, required this.livro});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(livro.titulo),
      subtitle: Text('${livro.autor} • ${livro.anoPublicacao}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () => repo.remover(livro),
      ),
    );
  }
}