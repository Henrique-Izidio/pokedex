import 'package:fpdart/fpdart.dart';
import 'package:pokedex/src/modules/pokemons/domain/entities/pokemon.dart';
import 'package:pokedex/src/modules/pokemons/domain/repositories/poke_repository.dart';

import '../errors/poke_exceptions.dart';


abstract class IGetPokemons {
  Future<Either<IFailure, List<Pokemon>>> call(int offset);
}

class GetPokemons implements IGetPokemons {
  final IPokeRepository repository;

  GetPokemons({required this.repository});

  @override
  Future<Either<IFailure, List<Pokemon>>> call(int offset) async {
      return await repository.getPokemons(offset);
  }
}
