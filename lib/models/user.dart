import 'package:equatable/equatable.dart';

/// User account model
class User extends Equatable {
  final String id;
  final String phoneNumber;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? profileImageUrl;
  final DateTime createdAt;
  final DateTime lastUpdated;
  final bool isVerified;

  const User({
    required this.id,
    required this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.profileImageUrl,
    required this.createdAt,
    required this.lastUpdated,
    this.isVerified = false,
  });

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}'.trim();

  @override
  List<Object?> get props => [
        id,
        phoneNumber,
        email,
        firstName,
        lastName,
        profileImageUrl,
        createdAt,
        lastUpdated,
        isVerified,
      ];

  User copyWith({
    String? id,
    String? phoneNumber,
    String? email,
    String? firstName,
    String? lastName,
    String? profileImageUrl,
    DateTime? createdAt,
    DateTime? lastUpdated,
    bool? isVerified,
  }) {
    return User(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdAt: createdAt ?? this.createdAt,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
