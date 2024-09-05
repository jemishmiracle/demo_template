import 'package:demo_template/constants/image_path.dart';

class UserModel {
  String user_name = "";
  String id = "";
  String socket_id = "";
  String email = "";
  String profile_pic = "";
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  UserModel({
    required this.id,
    required this.socket_id,
    required this.user_name,
    required this.email,
    required this.profile_pic,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.formJson(Map<String,dynamic> json) =>
      UserModel(
        user_name: json['user_name'] ?? "",
        id: json['_id'] ?? "",
        socket_id: json['socket_id'] ?? "",
        email: json['email'] ?? "",
        profile_pic: json['profile_pic'] ?? ImagePath.imgLogo,
        createdAt: DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now(),
        updatedAt: DateTime.tryParse(json['updatedAt'].toString()) ?? DateTime.now(),
      );

  Map<String,dynamic> toJson() => {
    'user_name' : user_name,
    '_id' : id,
    'socket_id' : socket_id,
    'email' : email,
    'profile_pic' : profile_pic,
    'createdAt' : createdAt.toIso8601String(),
    'updatedAt' : updatedAt.toIso8601String(),
  };
}