class Products {
  String name;
  String desc;
  String image;
  String fav;
  String id;

  Products(
      {required this.id,
      required this.name,
      required this.desc,
      required this.fav,
      required this.image});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        name: json['pro_name'],
        desc: json['pro_desc'],
        image: json['pro_image'],
        fav: json['pro_favurite'],
        id: json['pro_id'].toString());
  }
}
