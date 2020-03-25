import 'package:json_annotation/json_annotation.dart';

part 'flags_model.g.dart';

@JsonSerializable(explicitToJson: true, nullable: true)
class FlagsModel {
  String flagId;
  String flagDescription;
  String flagStatus;
  String flagType;
  String flagColor;
  int flagPriority;

  FlagsModel(this.flagId, this.flagDescription, this.flagStatus, this.flagType,
      this.flagColor, this.flagPriority);

  factory FlagsModel.fromJson(Map<String, dynamic> json) =>
      _$FlagsModelFromJson(json);

  toJson() {
    return _$FlagsModelToJson(this);
  }
}
