import 'package:abrefacil/models/api/customer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AdminUserPage extends StatelessWidget {
  const AdminUserPage({
    super.key,
    required this.userId,
  });

  final int userId;

  Future<dynamic> _getClients(Dio client) async {
    final res =
        await client.get('http://localhost:8000/api/users/$userId/clients/');
    return res.data;
  }

  Future<dynamic> _getUsersClients(Dio client) async {
    final res =
        await client.get('http://localhost:8000/api/user_client/$userId/');
    return res.data;
  }

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final clients = _getClients(dio);
    final usersClients = _getUsersClients(dio);

    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: FutureBuilder(
            future: Future.wait([
              clients,
              usersClients,
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final clients = [
                  for (dynamic json in snapshot.data![0])
                    Customer.fromJson(json)
                ];
                print(clients);
                print(snapshot.data![1][0]['user']);
              }

              return const SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Text('Fine'),
              );
            },
          ),
        ));
  }
}
