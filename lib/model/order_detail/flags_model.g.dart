// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flags_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlagsModel _$FlagsModelFromJson(Map<String, dynamic> json) {
  return FlagsModel(
    json['flagId'] as String,
    json['flagDescription'] as String,
    json['flagStatus'] as String,
    json['flagType'] as String,
    json['flagColor'] as String,
    json['flagPriority'] as int,
  );
}

Map<String, dynamic> _$FlagsModelToJson(FlagsModel instance) =>
    <String, dynamic>{
      'flagId': instance.flagId,
      'flagDescription': instance.flagDescription,
      'flagStatus': instance.flagStatus,
      'flagType': instance.flagType,
      'flagColor': instance.flagColor,
      'flagPriority': instance.flagPriority,
    };
