class User {
  User({
    required this.userName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'] as String,
      email: json['email'] as String,
    );
  }

  final String? userName;
  final String? email;
}
