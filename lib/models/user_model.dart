import 'dart:convert';

import 'package:single_project/models/address_model.dart';

class AuthModel {
  String accessToken;
  int accessTokenExpires;
  String refreshToken;
  User user;
  List<Address> address;
  Block? block;

  AuthModel({
    required this.accessToken,
    required this.accessTokenExpires,
    required this.refreshToken,
    required this.user,
    required this.address,
    this.block,
  });
  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'accessTokenExpires': accessTokenExpires,
      'refreshToken': refreshToken,
      'user': user,
      'address': address,
      'block': block,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      accessToken: map['accessToken'],
      accessTokenExpires: map['accessTokenExpires'],
      refreshToken: map['refreshToken'],
      user: map['user'] ?? {},
      address: map["address"] != null
          ? List<Address>.from(
              (map["address"] as List?)
                      ?.where((x) => x != null)
                      .map((x) => Address.fromJson(x as Map<String, dynamic>))
                      .toList() ??
                  [],
            )
          : [],
    );
  }
  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class User {
  String email;
  bool emailVerified;
  String provider;
  String socialId;
  String firstName;
  String lastName;
  String role;
  Avatar avatar;

  User({
    required this.email,
    required this.emailVerified,
    required this.provider,
    required this.socialId,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.avatar,
  });
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'emailVerified': emailVerified,
      'provider': provider,
      'socialId': socialId,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'avatar': avatar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      emailVerified: map['emailVerified'],
      provider: map['provider'],
      socialId: map['socialId'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      role: map['role'],
      avatar: map['avatar'],
    );
  }
  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Avatar {
  String publicId;
  String url;
  Avatar({
    required this.publicId,
    required this.url,
  });
}

class Block {
  bool isBlocked;
  List<ActivityLogs> activityLogs;
  Block(this.isBlocked, this.activityLogs);
}

class ActivityLogs {
  String action;
  String actionAt;
  String actionBy;
  String reason;
  String note;
  ActivityLogs(
    this.action,
    this.actionAt,
    this.actionBy,
    this.reason,
    this.note,
  );
}
