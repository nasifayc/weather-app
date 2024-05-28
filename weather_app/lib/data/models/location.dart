class Location {
  final String name;
  final String region;
  final String country;

  Location({required this.name, required this.region, required this.country});

  Map<String, dynamic> toJson() {
    return {'name': name, 'region': region, 'country': country};
  }
}
