// To parse this JSON data, do
//
//     final valorantModel = valorantModelFromJson(jsonString);

import 'dart:convert';

ValorantModel valorantModelFromJson(String str) =>
    ValorantModel.fromJson(json.decode(str));

String valorantModelToJson(ValorantModel data) => json.encode(data.toJson());

class ValorantModel {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? developerName;
  final dynamic characterTags;
  final String? displayIcon;
  final String? displayIconSmall;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  final String? killfeedPortrait;
  final String? background;
  final List<String>? backgroundGradientColors;
  final String? assetPath;
  final bool? isFullPortraitRightFacing;
  final bool? isPlayableCharacter;
  final bool? isAvailableForTest;
  final bool? isBaseContent;
  final Role? role;
  final dynamic recruitmentData;
  final List<Ability>? abilities;
  final dynamic voiceLine;

  ValorantModel({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.characterTags,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.recruitmentData,
    this.abilities,
    this.voiceLine,
  });

  factory ValorantModel.fromJson(Map<String, dynamic> json) => ValorantModel(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        developerName: json["developerName"],
        characterTags: json["characterTags"],
        displayIcon: json["displayIcon"],
        displayIconSmall: json["displayIconSmall"],
        bustPortrait: json["bustPortrait"],
        fullPortrait: json["fullPortrait"],
        fullPortraitV2: json["fullPortraitV2"],
        killfeedPortrait: json["killfeedPortrait"],
        background: json["background"],
        backgroundGradientColors: json["backgroundGradientColors"] == null
            ? []
            : List<String>.from(
                json["backgroundGradientColors"]!.map((x) => x)),
        assetPath: json["assetPath"],
        isFullPortraitRightFacing: json["isFullPortraitRightFacing"],
        isPlayableCharacter: json["isPlayableCharacter"],
        isAvailableForTest: json["isAvailableForTest"],
        isBaseContent: json["isBaseContent"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        recruitmentData: json["recruitmentData"],
        abilities: json["abilities"] == null
            ? []
            : List<Ability>.from(
                json["abilities"]!.map((x) => Ability.fromJson(x))),
        voiceLine: json["voiceLine"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "developerName": developerName,
        "characterTags": characterTags,
        "displayIcon": displayIcon,
        "displayIconSmall": displayIconSmall,
        "bustPortrait": bustPortrait,
        "fullPortrait": fullPortrait,
        "fullPortraitV2": fullPortraitV2,
        "killfeedPortrait": killfeedPortrait,
        "background": background,
        "backgroundGradientColors": backgroundGradientColors == null
            ? []
            : List<dynamic>.from(backgroundGradientColors!.map((x) => x)),
        "assetPath": assetPath,
        "isFullPortraitRightFacing": isFullPortraitRightFacing,
        "isPlayableCharacter": isPlayableCharacter,
        "isAvailableForTest": isAvailableForTest,
        "isBaseContent": isBaseContent,
        "role": role?.toJson(),
        "recruitmentData": recruitmentData,
        "abilities": abilities == null
            ? []
            : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "voiceLine": voiceLine,
      };
}

class Ability {
  final String? slot;
  final String? displayName;
  final String? description;
  final String? displayIcon;

  Ability({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: json["slot"],
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
      };
}

class Role {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? displayIcon;
  final String? assetPath;

  Role({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
      };
}
