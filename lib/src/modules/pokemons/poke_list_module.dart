import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/modules/pokemons/domain/repositories/poke_repository.dart';
import 'package:pokedex/src/modules/pokemons/domain/usecases/get_pokemons.dart';
import 'package:pokedex/src/modules/pokemons/external/datasourses/poke_datasourse.dart';
import 'package:pokedex/src/modules/pokemons/infra/datasourses/poke_datasourse.dart';
import 'package:pokedex/src/modules/pokemons/infra/repositories/poke_repository.dart';
import 'package:pokedex/src/modules/pokemons/presenter/pages/poke_list.dart';
import 'package:pokedex/src/modules/pokemons/presenter/pages/stores/pokemon_store.dart';
import 'package:uno/uno.dart';

class PokeListModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //usecases
        Bind.factory((i) => GetPokemons(repository: i())),

        //respositories
        Bind.factory<IPokeRepository>((i) => PokeRepository(datasourse: i())),

        //datasourses
        Bind.factory<IPokeDatasourse>((i) => PokeDatasourse(uno: i())),

        //clients
        Bind.factory<Uno>((i) => Uno()),

        //stores
        Bind.singleton((i) => PokemonStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const PokeListPage()),
      ];
}
