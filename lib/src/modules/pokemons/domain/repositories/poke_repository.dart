import 'package:fpdart/fpdart.dart';

import '../entities/pokemon.dart';
import '../errors/poke_exceptions.dart';

abstract class IPokeRepository {
  Future<Either<IFailure, List<Pokemon>>> getPokemons(int offset);
}
