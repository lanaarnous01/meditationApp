// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
 final String username;
final  String password;
 final String isexpired;

  User({
    required this.username,
    required this.password,
    required this.isexpired,
  });
  

  User copyWith({
    String? username,
    String? password,
    String? isexpired,
  }) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
      isexpired: isexpired ?? this.isexpired,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'isexpired': isexpired,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      password: map['password'] as String,
      isexpired: map['isexpired'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(username: $username, password: $password, isexpired: $isexpired)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.password == password &&
      other.isexpired == isexpired;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ isexpired.hashCode;
}
