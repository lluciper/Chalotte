import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/login/login_bloc.dart';
import '../../config/configs.dart';
import '../../core/components/appbar_custom.dart';
import '../../core/components/text_form_field_custom.dart';
import '../../gen/assets.gen.dart';
import '../../utils/themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.language = AppLanguage.vn, this.test});

  final AppLanguage language;
  final TestClass? test;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LuColors.black,
      // appBar: const AppBarCustom(
      //   title: 'title',
      // ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ).copyWith(top: 120),
            color: LuColors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Assets.imagesSplashImgSplash.image(
                      width: 160,
                      height: 160,
                    ),
                    const Gap(16),
                    TextFormFieldCustom(
                      controller: userNameController,
                      label: 'Tai khoan',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    const Gap(16),
                    TextFormFieldCustom(
                      controller: passwordController,
                      label: 'Mat khau',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    context.read<LoginBloc>().add(
                          LoginWithUserNamePassWord(
                            context,
                            userName: userNameController.text,
                            password: passwordController.text,
                          ),
                        );
                  },
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: LuColors.red,
                    ),
                    child: Text('Login'),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class TestClass {
  TestClass({this.test, this.test2});

  final String? test;
  final String? test2;
}
