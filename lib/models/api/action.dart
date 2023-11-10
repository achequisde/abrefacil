import 'package:abrefacil/enums/action_type.dart';
import 'package:abrefacil/types/mqtt_topic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'action.freezed.dart';
part 'action.g.dart';

@freezed
class Action with _$Action {
  const factory Action({
    required String id,
    required String deviceId,
    required String name,
    required MqttTopic topic,
    required ActionType type,
    required int tone,
  }) = _Action;

  factory Action.fromJson(Map<String, Object?> json) => _$ActionFromJson(json);
}
