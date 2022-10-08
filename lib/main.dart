import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/app_widget.dart';
import 'package:pokedex/src/modules/pokemons/poke_list_module.dart';

void main() {
  runApp(
    ModularApp(
      module: PokeListModule(),
      child: const AppWidget(),
    ),
  );
}
