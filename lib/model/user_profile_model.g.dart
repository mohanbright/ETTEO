
// GENERATED CODE - DO NOT MODIFY BY HAND

 part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************







UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return UserProfileModel(
    json['firstName'] as String,
    json['lastName'] as String,
    json['emailAddress'] as String,
    json['phoneNumber'] as String,
    json['contactId'] as String,
    json['userId'] as String,
    json['profileImage'] as String,
    json['resourceId'] as String,
   
  );
}

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'contactId': instance.contactId,
      'userId': instance.userId,
      'profileImage': instance.profileImage,
      'resourceId': instance.resourceId,
    };
