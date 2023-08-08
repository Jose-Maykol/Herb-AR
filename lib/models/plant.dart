class Plant {
  String? commonName;
  String? description;
  String? imageUrl;
  String? medicinalProperties;
  String? scientificName;

  Plant({
    this.commonName,
    this.description,
    this.imageUrl,
    this.medicinalProperties,
    this.scientificName,
  });

  Plant.fromJson(Map<String, dynamic> json) {
    commonName = json['commonName'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    medicinalProperties = json['medicinalProperties'];
    scientificName = json['scientificName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'commonName': commonName,
      'description': description,
      'imageUrl': imageUrl,
      'medicinalProperties': medicinalProperties,
      'scientificName': scientificName,
    };
  }
}
