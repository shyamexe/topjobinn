import 'dart:convert';
import 'dart:math';


import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:topjobinn/logic/authentication_cibit/authentication_cubit.dart';

class LoginState extends Equatable {
  final User? user;
  final String? errorMessage;
  const LoginState({
    this.user,
    this.errorMessage,
  });

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;
  const LoginSuccess({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class LoginFailure extends LoginState {
  String error;
  LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class LoginCubit extends Cubit<LoginState> {
   AuthenticationCubit authenticationCubit;
  LoginCubit({required this.authenticationCubit}) : super(LoginInitial());

  signInWithGoogle() async {
    try {
      emit(LoginLoading());

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      emit(LoginSuccess(user: result.user!));
      authenticationCubit.emit(AuthenticationSuccess());

    } catch (e) {
      emit(LoginState(errorMessage: e.toString()));

    }
  }

  signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    try {
      emit(LoginLoading());

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final result =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      print(result.user?.displayName);
      print(result.user?.email);

      if (result.user != null) {
        emit(LoginSuccess(user: result.user!));
        authenticationCubit.emit(AuthenticationSuccess());
      } else {
        emit(LoginFailure(error: 'failed'));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}

String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    /// Returns the sha256 hash of [input] in hex notation.

    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
