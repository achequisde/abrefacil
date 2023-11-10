import 'package:mqtt_client/mqtt_client.dart';

parseMqttMessage(MqttReceivedMessage<MqttMessage?> m) {
  final MqttPublishMessage message = m.payload as MqttPublishMessage;
  final payload =
      MqttPublishPayload.bytesToStringAsString(message.payload.message);

  return payload;
}
