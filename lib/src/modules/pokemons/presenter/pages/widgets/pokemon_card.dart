import 'package:flutter/material.dart';
import '../../../domain/entities/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    makeCustomId(pokemon.id),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    pokemon.name.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Image.network(
                pokemon.image,
                cacheHeight: 100,
                cacheWidth: 100,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) {
                    return child;
                  } else {
                    return Image.asset(
                      'assets/images/pokeball.png',
                      color: Colors.black.withOpacity(0.05),
                    );
                  }
                },
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  makeCustomId(String pokeId) {
    bool checkedId = false;
    while (!checkedId) {
      if (pokeId.length == 3) {
        checkedId = true;
      } else {
        pokeId = "0$pokeId";
      }
    }
    return "#$pokeId";
  }
}
