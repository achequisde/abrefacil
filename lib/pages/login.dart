import 'package:abrefacil/models/api/user.dart';
import 'package:abrefacil/pages/home.dart';
import 'package:abrefacil/pages/parent.dart';
import 'package:abrefacil/pages/signup.dart';
import 'package:abrefacil/providers/objects/user_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final submitButton = ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          final email = _emailController.text;

          final dio = Dio();

          final res = await dio.get(
            // 'http://10.0.2.2:8000/ai/users/',
            'http://localhost:8000/api/users/',
            queryParameters: {
              'email': email,
            },
          );

          final List<dynamic> data = res.data;

          if (data.isNotEmpty) {
            final user = User.fromJson(data[0]);

            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Enter'),
                  showCloseIcon: true,
                ),
              );

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return ParentPage(user: user);
                  },
                ),
              );
            }
          }
        }
      },
      child: const Text('Entrar'),
    );

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Spacer(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        final emailRegex = RegExp(r'\w+@\w+\.\w+');

                        if (value == null || value.isEmpty) {
                          return 'Please enter your email.';
                        }

                        if (!emailRegex.hasMatch(value)) {
                          return 'Wrong email format.';
                        }

                        return null;
                      },
                    ),
                    const Gap(20),
                    submitButton,
                  ],
                ),
              ),
              const Gap(10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignupPage();
                      },
                    ),
                  );
                },
                child: const Text(
                  'Nuevo usuario? Haz click aquí para registrarte.',
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
