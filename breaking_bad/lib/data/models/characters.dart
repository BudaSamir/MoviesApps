class Character {
  late int id;
  late String name;
  late String aliveOrDead;
  late String species;
  late String type;
  late String gender;
  late Map<String, dynamic> origin;
  late Map<String, dynamic> location;
  late String image;
  late List episode;
  late String url;

  Character.formJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    aliveOrDead = json["status"];
    species = json["species"];
    type = json["type"];
    gender = json["gender"];
    origin = json["origin"];
    location = json["location"];
    image = json["image"];
    episode = json["episode"];
    url = json["url"];
  }
}
