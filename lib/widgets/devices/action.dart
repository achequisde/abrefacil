import 'package:abrefacil/models/api_post_request.dart';
import 'package:abrefacil/utils/parse_mqtt_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';

class DeviceAction extends StatelessWidget {
  const DeviceAction({
    super.key,
    required this.topicPrefix,
    required this.action,
    required this.mqttStream,
  });

  final String topicPrefix;
  final Stream<List<MqttReceivedMessage<MqttMessage?>>>? mqttStream;
  final dynamic action;

  Color _getButtonColor(
      AsyncSnapshot<List<MqttReceivedMessage<MqttMessage?>>> snapshot) {
    if (snapshot.data == null) {
      return Colors.grey;
    }

    final message = parseMqttMessage(snapshot.data![0]);

    return message == 'ON' ? Colors.green : Colors.grey;
  }

  void _onPressedHandler() async {
    final postRequest = ApiPostRequest(
      topic: '$topicPrefix/${action['mqtt_topic']}',
      message: 'on',
    );

    final dio = Dio();
    await dio.post(
      'http://localhost:8000/api/publish/',
      data: postRequest.toJson(),
    );

    dio.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: mqttStream,
      builder: (context, snapshot) {
        final color = _getButtonColor(snapshot);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FilledButton.tonal(
            style: FilledButton.styleFrom(
              backgroundColor: color,
            ),
            onPressed: _onPressedHandler,
            child: FittedBox(
              child: Text(
                '${action['name']}\n${action['mqtt_topic']}',
              ),
            ),
          ),
        );
      },
    );
  }
}
