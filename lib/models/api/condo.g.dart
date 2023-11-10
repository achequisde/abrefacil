// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CondoImpl _$$CondoImplFromJson(Map<String, dynamic> json) => _$CondoImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      limit: json['limit'] as int,
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$$CondoImplToJson(_$CondoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'limit': instance.limit,
      'enabled': instance.enabled,
    };
