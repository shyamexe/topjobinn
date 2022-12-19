import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topjobinn/logic/authentication_cibit/authentication_cubit.dart';
import 'package:topjobinn/logic/user_data/user_data_cubit.dart';

import '../../../core/constants/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (context, state) {
          if (state is UserDatafailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Faild fetch data ',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          } else if (state is UserDataloaded) {
            return SizedBox(
              width: 1.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (state.user.photoURL != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: SizedBox(
                          height: 90.w,
                          width: 90.w,
                          child: Image.network(
                            '${state.user.photoURL}',
                            fit: BoxFit.cover,
                          )),
                    ),
                  Text(
                    'hello , \n${state.user.displayName}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0
                    ),
                      onPressed: () {
                        context.read<AuthenticationCubit>().logout();
                      },
                      child: Text('LogOut'))
                ],
              ),
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(animating: true),
            );
          }
        },
      ),
    );
  }
}
