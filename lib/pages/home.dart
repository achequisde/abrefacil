import 'dart:async';

import 'package:abrefacil/models/api/user.dart';
import 'package:abrefacil/models/api_post_request.dart';
import 'package:abrefacil/pages/admin.dart';
import 'package:abrefacil/providers/objects/mqtt.dart';
import 'package:abrefacil/utils/parse_mqtt_message.dart';
import 'package:abrefacil/widgets/devices/action.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqtt_client/mqtt_client.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
    required this.userId,
    required this.user,
  });

  final String userId;
  final User user;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late Future<dynamic> _devices;

  Future<void> _getUserDevices() async {
    final dio = Dio();

    final res = await dio
        .get('http://localhost:8000/api/users/${widget.userId}/devices/');

    return res.data;
  }

  @override
  void initState() {
    super.initState();
    _devices = _getUserDevices();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _devices = _getUserDevices();
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Datos actualizados'),
            showCloseIcon: true,
          ),
        );
      },
      child: FutureBuilder(
        future: Future.wait([_devices, ref.watch(mqttProvider.future)]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final devices = [
              for (final (i, device)
                  in (snapshot.data![0]['devices'] as List<dynamic>).indexed)
                DeviceColumn(
                  device: device,
                  actions: snapshot.data![0]['actions'][i],
                )
            ];

            final inicio = SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [...devices],
              ),
            );

            return inicio;
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class DeviceColumn extends ConsumerStatefulWidget {
  const DeviceColumn({
    super.key,
    required this.device,
    required this.actions,
  });

  final dynamic device;
  final List<dynamic> actions;

  @override
  ConsumerState<DeviceColumn> createState() => _DeviceColumnState();
}

class _DeviceColumnState extends ConsumerState<DeviceColumn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mqttRef = ref.read(mqttProvider.notifier);
    final mqttClient = ref.watch(mqttProvider).value!;

    for (final action in widget.actions) {
      final topic = '${widget.device['mqtt_prefix']}/${action['mqtt_topic']}';
      mqttRef.subscribe(topic);
    }

    final filters = [
      for (final action in widget.actions)
        MqttClientTopicFilter(
          '${widget.device['mqtt_prefix']}/${action['mqtt_topic']}',
          mqttClient.updates,
        )
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.device['name']} + ${widget.device['mqtt_prefix']}',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (final (i, action) in widget.actions.indexed)
                  DeviceAction(
                    topicPrefix: widget.device['mqtt_prefix'],
                    action: action,
                    mqttStream: filters[i].updates,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
