import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mqtt.g.dart';

@Riverpod(keepAlive: true)
class Mqtt extends _$Mqtt {
  @override
  Future<MqttServerClient> build() async {
    final client = MqttServerClient('test.mosquitto.org', '');

    // client.logging(on: true);
    client.setProtocolV311();

    client.keepAlivePeriod = 20;

    try {
      await client.connect();
    } on NoConnectionException {
      client.disconnect();
    } on SocketException {
      client.disconnect();
    }

    return client;
  }

  void subscribe(String topic) {
    state.whenData(
      (value) => value.subscribe(topic, MqttQos.atLeastOnce),
    );
  }

  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder()..addString(message);

    state.whenData(
      (value) => value.publishMessage(
        topic,
        MqttQos.atLeastOnce,
        builder.payload!,
        retain: true,
      ),
    );
  }

  Stream<List<MqttReceivedMessage<MqttMessage>>>? updates() {
    return state.when(
      data: (data) => data.updates,
      error: (error, stackTrace) => null,
      loading: () => null,
    );
  }
}
