// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/data/web/characters_api.dart';

class CharactersRepository {
  final CharactersAPI charactersAPI;
  CharactersRepository({required this.charactersAPI});

  Future<List<Character>> getAllCharacter() async {
    final character = await charactersAPI.getAllCharacter();
    return character.map((character) => Character.formJson(character)).toList();
  }
}
