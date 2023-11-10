import 'package:abrefacil/pages/admin/client.dart';
import 'package:abrefacil/pages/admin/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late final Future<dynamic> _users;
  late final Future<dynamic> _clients;
  late final Future<dynamic> _devices;

  Future<dynamic> _getUsers(Dio client) async {
    final res = await client.get('http://localhost:8000/api/users/');
    return res.data;
  }

  Future<dynamic> _getClients(Dio client) async {
    final res = await client.get('http://localhost:8000/api/clients/');
    return res.data;
  }

  Future<dynamic> _getDevices(Dio client) async {
    final res = await client.get('http://localhost:8000/api/devices/');
    return res.data;
  }

  @override
  void initState() {
    super.initState();

    final dio = Dio();

    _users = _getUsers(dio);
    _clients = _getClients(dio);
    _devices = _getDevices(dio);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([_users, _clients, _devices]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                ExpansionTile(
                  title: const Text('Usuarios'),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      child: ListView.builder(
                        itemCount: snapshot.data?[0].length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            final id = snapshot.data?[0][index]['id'];

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return AdminUserPage(
                                    userId: id,
                                  );
                                },
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              snapshot.data?[0][index]['name'],
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            trailing: Text(
                              snapshot.data?[0][index]['email'],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                ExpansionTile(
                  title: const Text('Clientes'),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      child: ListView.builder(
                        itemCount: snapshot.data?[0].length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return AdminClientPage(
                                    clientId: snapshot.data?[1][index]['id'],
                                  );
                                },
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              snapshot.data?[1][index]['name'],
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            // trailing: Text(
                            //   snapshot.data?[0][index]['email'],
                            // ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                ExpansionTile(
                  title: const Text('Dispositivos'),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      child: ListView.builder(
                        itemCount: snapshot.data?[0].length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                              snapshot.data?[2][index]['name'],
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            // trailing: Text(
                            //   snapshot.data?[2][index]['email'],
                            // ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
