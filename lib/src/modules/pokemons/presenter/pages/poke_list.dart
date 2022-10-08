import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/modules/pokemons/presenter/pages/states/pokemon_states.dart';
import 'package:pokedex/src/modules/pokemons/presenter/pages/stores/pokemon_store.dart';
import 'package:pokedex/src/modules/pokemons/presenter/pages/widgets/pokemon_card.dart';

class PokeListPage extends StatefulWidget {
  const PokeListPage({super.key});

  @override
  State<PokeListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  late final ScrollController _scrollController;
  int pokeListLenght = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<PokemonStore>().fetchPokemons(pokeListLenght, false);
      }
    });
    context.read<PokemonStore>().fetchPokemons(null, true);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PokemonStore>();
    final state = store.value;

    Widget child = Container();

    if (state is LoadingPokemonState) {
      child = Center(
        child: Image.asset('assets/images/pika_loader.gif'),
      );
    }
    if (state is SuccessPokeState) {
      child = AnimatedBuilder(
        animation: store,
        builder: (context, snapshot) {
          pokeListLenght = state.pokemons.length;
          return Stack(
            children: [
              ListView.separated(
                controller: _scrollController,
                itemBuilder: ((context, index) {
                  return PokemonCard(pokemon: state.pokemons[index]);
                }),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: pokeListLenght,
              ),
              ValueListenableBuilder(
                valueListenable: ValueNotifier(state.loadingMore),
                builder: (context, bool value, child) {
                  return (value)
                      ? Positioned(
                          left: (MediaQuery.of(context).size.width / 2) - 20,
                          bottom: 24,
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container();
                },
              )
            ],
          );
        },
      );
    }

    if(state is ErrorPokemonState) {
      child = Center(
        child: Text(state.mensage),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: child,
    );
  }
}
