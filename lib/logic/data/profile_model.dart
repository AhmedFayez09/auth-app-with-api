class ProfileModel {
  String? userName;
  String? email;
  int? phone;
  String? id;
  ProfileModel({
    this.email,
    this.id,
    this.phone,
    this.userName,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    email = json['email'];
    phone = json['phone'];
    id = json['_id'];
  }
}
