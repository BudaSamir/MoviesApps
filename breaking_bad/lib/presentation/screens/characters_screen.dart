import 'package:breaking_bad/constants/colors.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/domain/cubit/characters_cubit.dart';
import 'package:breaking_bad/presentation/widgets/character_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacter;
  late List<Character> searchingForCharacter;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    allCharacter = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacter = (state).characters;
        return buildLoadedListWidgets();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.grey,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 3, crossAxisSpacing: 3),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _searchTextController.text.isEmpty
            ? allCharacter.length
            : searchingForCharacter.length,
        itemBuilder: (BuildContext context, int index) {
          return CharacterItem(
              character: _searchTextController.text.isEmpty
                  ? allCharacter[index]
                  : searchingForCharacter[index]);
        });
  }

  Center showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.yellow,
      ),
    );
  }

  Text _buildAppBArTitle() {
    return const Text("Characters", style: TextStyle(color: MyColors.grey));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.yellow,
        leading: _isSearching
            ? const BackButton(
                color: MyColors.grey,
              )
            : Container(),
        title: _isSearching ? _buildSearchField() : _buildAppBArTitle(),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.grey,
      decoration: const InputDecoration(
          hintText: "Find a Character",
          border: InputBorder.none,
          hintStyle: TextStyle(color: MyColors.grey, fontSize: 18)),
      style: const TextStyle(color: MyColors.grey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  addSearchedOrItemsToSearchedList(String searchedCharacter) {
    searchingForCharacter = allCharacter
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearching();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: MyColors.grey,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: const Icon(
              Icons.search,
              color: MyColors.grey,
            ))
      ];
    }
  }

  _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: _stopSearching,
    ));
    setState(() {
      _isSearching = true;
    });
  }

  _stopSearching() {
    _clearSearching();

    setState(() {
      _isSearching = false;
    });
  }

  _clearSearching() {
    setState(() {
      _searchTextController.clear();
    });
  }
}
