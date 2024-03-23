import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app_language/generated/l10n.dart';
import 'src/bloc/app_bloc.dart';
import 'src/bloc/app_bloc_observer.dart';
import 'src/config/injection/dependency_injection.dart';
import 'src/config/routers/app_router.dart';
import 'src/core/session_timeout/session_config.dart';
import 'src/core/session_timeout/session_timeout_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await registerDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sessionConfig = SessionConfig(
        invalidateSessionForAppLostFocus: const Duration(seconds: 180),
        invalidateSessionForUserInactivity: const Duration(seconds: 300));
    sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) async {
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
        // TODO: handle user  inactive timeout
        print('SessionTimeoutState.userInactivityTimeout');
      } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        // TODO: handle user  app lost focus timeout
        print('SessionTimeoutState.appFocusTimeout');
      }
    });
    return SessionTimeoutManager(
      sessionConfig: sessionConfig,
      child: MultiBlocProvider(
        providers: AppBloc.listBlocProviders,
        child: MaterialApp.router(
          title: 'Chalotte',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.green,
          ),
          routerConfig: AppGoRouter().router,
          locale: const Locale('vi'),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
