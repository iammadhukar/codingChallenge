class Country {
  final String countryCode;
  final double probability;

  Country(this.countryCode, this.probability);

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      json['country_id'],
      json['probability'],
    );
  }
}
