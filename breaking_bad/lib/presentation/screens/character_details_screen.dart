import 'package:breaking_bad/constants/colors.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title:
            Text(character.name, style: const TextStyle(color: MyColors.white)),
        background: Hero(
            tag: character.id,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: const TextStyle(
                color: MyColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          TextSpan(
              text: value,
              style: const TextStyle(
                color: MyColors.white,
                fontSize: 16,
              )),
        ]));
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.yellow,
      thickness: 2,
    );
  }

  List<Widget> contant() {
    List<String> title = [
      "status : ",
      "species : ",
      "type : ",
      "gender : ",
      "origin : ",
      "location : ",
      "episodes : "
    ];
    List<String> subTitle = [
      character.aliveOrDead,
      character.species,
      character.type,
      character.gender,
      character.origin["name"],
      character.location["name"],
      "${character.episode.length}"
    ];
    List<double> divides = [290, 280, 300, 290, 290, 280, 270];
    List<Widget> list = [];
    for (int i = 0; i < title.length; i++) {
      if (subTitle[i].isNotEmpty) {
        list.add(characterInfo(title[i], subTitle[i]));
        list.add(buildDivider(divides[i]));
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 1),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: contant(),
              ),
            )
          ]))
        ],
      ),
    );
  }
}
