
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';
part 'user_profile_model.g.dart';

@JsonSerializable(explicitToJson: true, nullable: true)
class UserProfileModel extends BaseModel{

  String firstName;
  String lastName;
  String emailAddress;
  String profileImage;
  String phoneNumber;
  String contactId;
  String userId;
  String resourceId;

  UserProfileModel(
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.profileImage,
    this.phoneNumber,
    this.contactId,
    this.userId,
    this.resourceId
 );

 factory UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);


  String get fullName {
    return this.firstName + ' ' + this.lastName;
  }
  
  @override
  get key => userId;

  @override
  toJson() {
   return _$UserProfileModelToJson(this);
  }
  
}