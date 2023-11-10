import 'package:abrefacil/models/api/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({
    super.key,
  });

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _signupFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailInput = TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'correo@ejemplo.com',
      ),
    );

    final nameInput = TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        hintText: 'Juan',
      ),
    );

    final surnameInput = TextFormField(
      controller: _surnameController,
      decoration: const InputDecoration(
        hintText: 'Rodriguez',
      ),
    );

    final signupButton = ElevatedButton(
      onPressed: () async {
        if (_signupFormKey.currentState!.validate()) {
          final newUser = User(
            email: _emailController.text,
            name: _nameController.text,
            surname: _surnameController.text,
            enabled: false,
          );

          final dio = Dio();

          try {
            final res = await dio.post(
              'http://localhost:8000/api/users/',
              data: newUser.toJson(),
            );

            if (res.statusCode == 201) {
              print(res.data);
            } else {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No se pudo crear usuario.'),
                    showCloseIcon: true,
                  ),
                );
              }
            }
          } catch (_) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No se pudo crear usuario.'),
                  showCloseIcon: true,
                ),
              );
            }
          }
        }
      },
      child: const Text('Registrarse'),
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
                key: _signupFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Correo'),
                    emailInput,
                    const Gap(20),
                    const Text('Nombre'),
                    nameInput,
                    const Gap(20),
                    const Text('Apellido'),
                    surnameInput,
                    const Gap(20),
                    Align(
                      child: signupButton,
                    ),
                  ],
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
