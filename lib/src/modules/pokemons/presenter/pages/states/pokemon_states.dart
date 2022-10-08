import '../../../domain/entities/pokemon.dart';

abstract class IPokeState {}

class SuccessPokeState implements IPokeState {
  final List<Pokemon> pokemons;
  bool loadingMore;

  SuccessPokeState(this.pokemons, this.loadingMore);
}

class EmptyPokeState extends SuccessPokeState {
  EmptyPokeState() : super([], false);
}

class LoadingMorePokeState extends SuccessPokeState {
  LoadingMorePokeState(super.pokemons, super.loadingMore);
}
class LoadingPokemonState extends IPokeState {}

class ErrorPokemonState extends IPokeState {
  final String mensage;

  ErrorPokemonState({required this.mensage});
}
