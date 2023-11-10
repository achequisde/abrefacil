// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceImpl _$$DeviceImplFromJson(Map<String, dynamic> json) => _$DeviceImpl(
      id: json['id'] as String,
      condoId: json['condoId'] as String,
      macAddress: json['macAddress'] as String,
      name: json['name'] as String,
      prefix: json['prefix'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'condoId': instance.condoId,
      'macAddress': instance.macAddress,
      'name': instance.name,
      'prefix': instance.prefix,
      'phoneNumber': instance.phoneNumber,
    };
