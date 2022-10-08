import '../../domain/entities/pokemon.dart';
import 'package:pokedex/src/shared/api_consts.dart' as api_consts;

class PokeAdapter {
  static Pokemon fromJson(dynamic map) {
    String pokeUrl = map['url'] as String;
    String id = pokeUrl.replaceAll(api_consts.baseUrl, "");
    id = id.replaceAll('/', "");
    return Pokemon(
      id: id,
      name: map['name'],
      image: "${api_consts.baseImageUrl}$id.png",
      url: pokeUrl,
    );
  }
}
