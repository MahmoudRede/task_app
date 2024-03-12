class UserModel {
  final String userName;
  final String email;
  final String phone;
  final String uId;


  UserModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.uId,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userName: json["userName"]??"",
    email: json["email"]??"",
    phone: json["phone"]??"",
    uId: json["uId"]??"",

  );

  Map<String, dynamic> toMap() => {
    "userName": userName,
    "email": email,
    "phone": phone,
    "uId": uId,

  };
}