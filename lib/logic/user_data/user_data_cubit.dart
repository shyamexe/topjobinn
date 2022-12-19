// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

class UserDataInitial extends UserDataState {}

class UserDataLading extends UserDataState {}

class UserDataloaded extends UserDataState {
  User user;
  UserDataloaded({
    required this.user,
  });
  @override
  List<Object> get props => [];
}

class UserDatafailure extends UserDataState {}

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial()){
    fetchUserData();
  }

  fetchUserData() {
    emit(UserDataLading());

    try {
      emit(UserDataloaded(user: FirebaseAuth.instance.currentUser!));
    } catch (e) {
      emit(UserDatafailure());
    }
  }
}
