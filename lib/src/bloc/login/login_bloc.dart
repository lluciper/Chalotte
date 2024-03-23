import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../config/routers/name_router.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginWithUserNamePassWord>(onLoginWithUserNamePassWord);
  }

  final db = FirebaseFirestore.instance;

  void onLoginWithUserNamePassWord(
    LoginWithUserNamePassWord event,
    Emitter<LoginState> emit,
  ) async {

    await db.collection('propose').get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
    event.context.push('/${NameRouter.HOME_SCREEN}');

    print('onLoginWithUserNamePassWord: ${event.userName}');
    print('onLoginWithUserNamePassWord: ${event.password}');
  }
}
