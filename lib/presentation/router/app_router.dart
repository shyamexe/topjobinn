import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topjobinn/logic/authentication_cibit/authentication_cubit.dart';
import 'package:topjobinn/logic/login_cubit/login_cubit.dart';
import 'package:topjobinn/logic/user_data/user_data_cubit.dart';
import 'package:topjobinn/presentation/screens/login_screen/login_screen.dart';

import '../../core/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';
import '../screens/home_screen/home_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String login = '/loginScreen';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationSuccess) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => UserDataCubit(),
                    ),
                    BlocProvider.value(
                     value: context.read<AuthenticationCubit>(),
                    ),
                  ],
                  child: HomeScreen(),
                );
              } else {
                return BlocProvider(
                  create: (context) => LoginCubit(
                      authenticationCubit: context.read<AuthenticationCubit>()),
                  child: LoginScreen(),
                );
              }
            },
          ),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(
                authenticationCubit: context.read<AuthenticationCubit>()),
            child: LoginScreen(),
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
