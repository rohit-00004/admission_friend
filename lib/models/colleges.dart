class Colleges{
  final int code;
  final String college, city;

  Colleges({required this.code, required this.college, required this.city});

  factory Colleges.fromJson(Map<String, dynamic> json){
    return Colleges(
      code: json['code'] as int, 
      college: json['college'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'code': code,
      'college': college,
      'city': city,
    };
  }
}