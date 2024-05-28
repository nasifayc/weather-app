class Location {
  String? name;
  String? region;
  String? country;

  Location({this.name, this.region, this.country});

  Map<String, dynamic> toJson() {
    return {'name': name, 'region': region, 'country': country};
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
    );
  }
}
