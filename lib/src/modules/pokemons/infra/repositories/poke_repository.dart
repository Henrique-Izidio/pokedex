import 'package:fpdart/fpdart.dart';

import '../../domain/entities/pokemon.dart';
import '../../domain/errors/poke_exceptions.dart';
import '../../domain/repositories/poke_repository.dart';
import '../adapters/poke_adapter.dart';
import '../datasourses/poke_datasourse.dart';

class PokeRepository implements IPokeRepository {
  final IPokeDatasourse datasourse;

  PokeRepository({required this.datasourse});

  @override
  Future<Either<IFailure, List<Pokemon>>> getPokemons(int offset) async {
    try {
      final response = await datasourse.getPokemons(offset);
      List results = response['results'];
      final pokeList = results.map(PokeAdapter.fromJson).toList();
      return right(pokeList);
    } on IFailure catch (e) {
      return left(e);
    }
  }
}
