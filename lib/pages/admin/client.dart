import 'package:abrefacil/widgets/admin/user_checkbox.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AdminClientPage extends StatelessWidget {
  const AdminClientPage({
    super.key,
    required this.clientId,
  });

  final int clientId;

  Future<dynamic> _getUsers(Dio client) async {
    final res =
        await client.get('http://localhost:8000/api/clients/$clientId/');
    return res.data;
  }

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final users = _getUsers(dio);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: FutureBuilder(
          future: users,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data['users'].length,
                  itemBuilder: (context, index) {
                    return AdminUserCheckbox(
                      title: Text(snapshot.data['users'][index]['name']),
                      value: snapshot.data['enabled'][index]['enabled'],
                    );
                  },
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
