class UserId {
  final String? fullName;
  final String email;
  final String password;
  final bool isLogin;

  UserId({this.fullName, required this.password, required this.email, this.isLogin = false});

  factory UserId.fromJson(Map<String, dynamic> json){
    return UserId(fullName: json['fullName'],email: json['email'], password: json['password']);
  }

  Future<void> create({required String fullName, required email, required password}) async {
    try {
      // await _fireCloud.add
    } catch (e) {
      
    }
  }
}