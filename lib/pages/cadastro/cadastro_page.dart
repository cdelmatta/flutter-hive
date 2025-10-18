import 'package:flutter/material.dart';
import '../../data/models/livro.dart';
import '../../data/repositories/livro_repository.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}
  
 class _CadastroPageState extends State<CadastroPage>{
    final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _autorController = TextEditingController();
  final _anoController = TextEditingController();
  final _editoraController = TextEditingController();

  final repo = LivroRepository();

   void _salvar() async {
    if (_formKey.currentState!.validate()) {
      final livro = Livro(
        titulo: _tituloController.text,
        autor: _autorController.text,
        anoPublicacao: int.tryParse(_anoController.text) ?? 0,
        editora: _editoraController.text,
      );
      await repo.adicionar(livro);
      if (mounted) Navigator.pop(context);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Livro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (v) =>
                    v!.isEmpty ? 'Informe o título do livro' : null,
              ),
              TextFormField(
                controller: _autorController,
                decoration: const InputDecoration(labelText: 'Autor'),
                validator: (v) => v!.isEmpty ? 'Informe o autor' : null,
              ),
              TextFormField(
                controller: _anoController,
                decoration: const InputDecoration(labelText: 'Ano de Publicação'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _editoraController,
                decoration: const InputDecoration(labelText: 'Editora'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvar,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }
