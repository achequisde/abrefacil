import 'package:abrefacil/types/mqtt_topic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
class Device with _$Device {
  const factory Device({
    required String id,
    required String condoId,
    required String macAddress,
    required String name,
    required MqttTopic prefix,
    required String phoneNumber,
  }) = _Device;

  factory Device.fromJson(Map<String, Object?> json) => _$DeviceFromJson(json);
}
