import 'package:hive/hive.dart';
import '../models/livro.dart';

class LivroRepository {
  final Box<Livro> _box = Hive.box<Livro>('livros');

  List<Livro> listar() => _box.values.toList();

  Future<void> adicionar(Livro livro) async{
    await _box.add(livro);
  }

  Future<void> remover(Livro livro) async{
    await livro.delete();
  }
}