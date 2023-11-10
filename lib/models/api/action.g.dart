// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActionImpl _$$ActionImplFromJson(Map<String, dynamic> json) => _$ActionImpl(
      id: json['id'] as String,
      deviceId: json['deviceId'] as String,
      name: json['name'] as String,
      topic: json['topic'] as String,
      type: $enumDecode(_$ActionTypeEnumMap, json['type']),
      tone: json['tone'] as int,
    );

Map<String, dynamic> _$$ActionImplToJson(_$ActionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'name': instance.name,
      'topic': instance.topic,
      'type': _$ActionTypeEnumMap[instance.type]!,
      'tone': instance.tone,
    };

const _$ActionTypeEnumMap = {
  ActionType.on: 'on',
  ActionType.onAndOff: 'onAndOff',
};
