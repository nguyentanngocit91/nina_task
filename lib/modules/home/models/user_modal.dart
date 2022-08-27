class UserModel {
  final String? id;
  final String? email;
  final String? password;
  final String? token;
  final int? status;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.token,
    this.status,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? password,
    String? token,
    int? status,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
      status: status ?? this.status,
    );
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        email = json['email'] as String?,
        password = json['password'] as String?,
        token = json['token'] as String?,
        status = json['status'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'email': email,
        'password': password,
        'token': token,
        'status': status
      };
}
