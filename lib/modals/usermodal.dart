class UserModal {
  String id;
  String name;
  String username;
  String password;
  String contact;

  UserModal(
      {required this.id,
      required this.name,
      required this.username,
      required this.password,
      required this.contact});

  factory UserModal.fromJson(Map<String, dynamic> json) {
    return UserModal(
        name: json['name'],
        username: json['username'],
        password: json['password'],
        contact: json['contact_num'],
        id: json['id'].toString());
  }
}
