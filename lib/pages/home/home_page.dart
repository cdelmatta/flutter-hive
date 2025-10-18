import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/livro.dart';
import '../cadastro/cadastro_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Livro>('livros');

    return Scaffold(
      appBar: AppBar(
        title: const Text('📚 Meus Livros'),
        centerTitle: true,
        elevation: 2,
      ),

      drawer: Drawer(
        backgroundColor: const Color(0xFF1E1E2C),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6D28D9), Color(0xFF9333EA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Biblioteca Hive',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFFC084FC)),
              title: const Text(
                'Sobre o App',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color(0xFF2D2D3A),
                      title: const Text(
                        'Sobre o Aplicativo',
                        style: TextStyle(
                          color: Color(0xFFC084FC),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text(
                        'Este aplicativo foi desenvolvido em Flutter utilizando o Hive como banco de dados local.\n\n'
                        '📘 Funcionalidades:\n'
                        '• Cadastrar livros\n'
                        '• Listar livros\n'
                        '• Excluir registros\n\n'
                        'Criado por Calebe Henrique dos Sntos Delmatta, demonstrando persistência local e boas práticas de arquitetura Flutter.',
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Fechar',
                            style: TextStyle(color: Colors.purpleAccent),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),

      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<Livro> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum livro cadastrado ainda 📖',
                style: TextStyle(fontSize: 16, color: Color(0xFF5B21B6)),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: box.length,
            itemBuilder: (context, index) {
              final livro = box.getAt(index)!;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    title: Text(
                      livro.titulo,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E1B4B),
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      '${livro.autor} • ${livro.anoPublicacao}',
                      style: const TextStyle(
                        color: Color(0xFF7C3AED),
                        fontSize: 15,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      tooltip: 'Excluir Livro',
                      onPressed: () => livro.delete(),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: 'Adicionar novo livro',
        child: const Icon(Icons.add, size: 28),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const CadastroPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position:
                          Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeOutCubic,
                            ),
                          ),
                      child: child,
                    );
                  },
            ),
          );
        },
      ),
    );
  }
}
