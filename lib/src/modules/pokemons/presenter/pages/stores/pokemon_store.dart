import 'package:flutter/cupertino.dart';
import 'package:pokedex/src/modules/pokemons/domain/usecases/get_pokemons.dart';
import '../../../domain/entities/pokemon.dart';
import '../states/pokemon_states.dart';

class PokemonStore extends ValueNotifier<IPokeState> {
  PokemonStore(this.getPokemons) : super(EmptyPokeState());
  final IGetPokemons getPokemons;
  List<Pokemon> result = [];

  void emit(IPokeState newState) => value = newState;

  Future<void> fetchPokemons(int? offset, bool isFirstLoad) async {
    emit((isFirstLoad)
        ? LoadingPokemonState()
        : LoadingMorePokeState(result, true));
    // result += await getPokemons(offset ?? 0);
    final newResult = await getPokemons(offset ?? 0);
    final newState = newResult.fold(
        (l) => ErrorPokemonState(mensage: l.mensage),
        (r) {
          result += r;
          return SuccessPokeState(result, false);
        } 
    );
    // final newState = SuccessPokeState(result, false);
    emit(newState);
  }
}
