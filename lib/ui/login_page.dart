// ignore_for_file: use_build_context_synchronously

import 'package:app_checklist_testryan/model/user_model.dart';
import 'package:app_checklist_testryan/services/login_service.dart';
import 'package:app_checklist_testryan/ui/home_page.dart';
import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginService _loginService = LoginService();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  login() async {
    if (formKey.currentState!.validate()) {
      UserModel? user = await _loginService.login(
        _usernameController.text,
        _passwordController.text,
      );
      if (user != null) {
        DInfo.dialogSuccess(context, 'Berhasil Login');
        DInfo.closeDialog(context, actionAfterClose: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const HomePage(),
            ),
          );
        });
      } else {
        DInfo.dialogError(context, 'Username atau password salah');
        DInfo.closeDialog(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DView.spaceHeight(30),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo, Selamat datang di Aplikasi \nTo-Do List',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: Colors.grey.shade900),
                            ),
                            DView.spaceHeight(30),
                            TextFormField(
                              controller: _usernameController,
                              validator: (value) =>
                                  value == '' ? 'Username harus diisi' : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: TextStyle(color: Colors.grey.shade900),
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade50,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Username',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                            ),
                            DView.spaceHeight(16),
                            TextFormField(
                              controller: _passwordController,
                              validator: (value) =>
                                  value == '' ? 'Password harus diisi' : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              style: TextStyle(color: Colors.grey.shade900),
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade50,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Password',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    DView.spaceHeight(14),
                                  ],
                                ),
                              ],
                            ),
                            DView.spaceHeight(50),
                            Material(
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                onTap: () => login(),
                                borderRadius: BorderRadius.circular(8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 16),
                                      child: Text(
                                        'Masuk',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DView.spaceHeight(30),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum punya akun? ',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade900),
                          ),
                        ],
                      ),
                    ),
                    DView.spaceHeight(30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
