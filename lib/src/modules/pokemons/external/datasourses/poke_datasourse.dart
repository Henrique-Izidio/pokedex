import 'package:uno/uno.dart';

import '../../../../shared/api_consts.dart' as api_consts;
import '../../domain/errors/poke_exceptions.dart';
import '../../infra/datasourses/poke_datasourse.dart';

class PokeDatasourse implements IPokeDatasourse {
  final Uno uno;

  PokeDatasourse({required this.uno});
  @override
  Future<Map> getPokemons(int offset) async {
    final String url = "${api_consts.baseUrl}?offset=$offset&limit=20";
    try {
      final Response response = await uno.get(url);
      return response.data;
    } on UnoError catch (e) {
      throw UndefainedException(mensage: e.message);
    }
  }
}
