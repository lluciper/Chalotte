import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/injection/dependency_injection.dart';
import 'login/login_bloc.dart';

class AppBloc {
  static final List<BlocProvider> listBlocProviders = [
    BlocProvider<LoginBloc>(create: (_) => getIt<LoginBloc>())
  ];
}
