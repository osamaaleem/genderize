class Gender {
  String name;
  String gender;
  double probability;
  int count;
  Gender(
      {required this.name,
      required this.gender,
      required this.probability,
      required this.count});
  static Gender fromJson(Map<String, dynamic> json) => Gender(
      name: json['name'] as String,
      gender: json['gender'] as String,
      probability: json['probability'] as double,
      count: json['count'] as int);
}
