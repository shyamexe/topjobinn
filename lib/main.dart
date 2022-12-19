import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:topjobinn/logic/authentication_cibit/authentication_cubit.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'firebase_options.dart';
import 'presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375, 812),
      builder: (context,child) {
        return BlocProvider(
          create: (context) => AuthenticationCubit(),
          child: MaterialApp(
            title: Strings.appTitle,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRouter.home,
            onGenerateRoute: AppRouter.onGenerateRoute,
          ),
        );
      }
    );
  }
}
