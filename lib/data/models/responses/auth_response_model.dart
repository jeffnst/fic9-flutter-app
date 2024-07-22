import 'dart:convert';

class AuthResponseModel {
    final String jwt;
    final User user;

    AuthResponseModel({
        required this.jwt,
        required this.user,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        jwt: json["jwt"],
        user: User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "jwt": jwt,
        "user": user.toMap(),
    };
}

class User {
    final int id;
    final String username;
    final String email;
    final String provider;
    final bool confirmed;
    final bool blocked;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Role role;

    User({
        required this.id,
        required this.username,
        required this.email,
        required this.provider,
        required this.confirmed,
        required this.blocked,
        required this.createdAt,
        required this.updatedAt,
        required this.role,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        role: Role.fromMap(json["role"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "role": role.toMap(),
    };
}

class Role {
    final int id;
    final String name;
    final String description;
    final String type;
    final DateTime createdAt;
    final DateTime updatedAt;

    Role({
        required this.id,
        required this.name,
        required this.description,
        required this.type,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Role.fromJson(String str) => Role.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Role.fromMap(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
