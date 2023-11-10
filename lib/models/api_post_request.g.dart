// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiPostRequestImpl _$$ApiPostRequestImplFromJson(Map<String, dynamic> json) =>
    _$ApiPostRequestImpl(
      topic: json['topic'] as String,
      message: json['msg'] as String,
    );

Map<String, dynamic> _$$ApiPostRequestImplToJson(
        _$ApiPostRequestImpl instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'msg': instance.message,
    };
