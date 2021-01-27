class Country {
  final String name;
  final String code;
  final String region;

  Country({this.name, this.code, this.region});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["country"],
      code: json["id"],
      region: json["region"],
    );
  }
}
