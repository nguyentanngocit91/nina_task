import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {

    on<GoogleSignInRequested>((event, emit) async {
      print("object");
      emit(Loading());
      try{
        await authRepository.signInWithGoogle();
        print("res: ${Authenticated()}");
        emit(Authenticated());
      }
       catch(e){
         await authRepository.signInWithGoogle();
         print("res: ${Authenticated()}");
         print("lỗi: ${UnAuthenticated()}");
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());

       }
    });

    on<SignOutRequested>((event, emit) async {
      try{
        await authRepository.signOut();
        emit(UnAuthenticated());
      }
      catch(e){
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

  }
}
