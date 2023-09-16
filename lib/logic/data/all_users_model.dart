class AllUsersModel {
  List<AllUsers>? allUsers;

  AllUsersModel({this.allUsers});

  AllUsersModel.fromJson(Map<String, dynamic> json) {
    if (json['AllUsers'] != null) {
      allUsers = <AllUsers>[];
      json['AllUsers'].forEach((v) {
        allUsers!.add(new AllUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allUsers != null) {
      data['AllUsers'] = this.allUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllUsers {
  String? role;
  String? sId;
  String? username;
  String? email;
  String? password;
  int? phone;
  int? iV;

  AllUsers(
      {this.role,
      this.sId,
      this.username,
      this.email,
      this.password,
      this.phone,
      this.iV});

  AllUsers.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['__v'] = this.iV;
    return data;
  }
}
