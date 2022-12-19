import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {}

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial()){
    checkAuthentication();
  }

  checkAuthentication() async {
    if (await FirebaseAuth.instance.authStateChanges().first != null) {
      print('Authenticated');
     
      emit(AuthenticationSuccess());
    } else {
      print('Not Authenticated');
      emit(AuthenticationFailure());
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    
    emit(AuthenticationFailure());
  }
}
