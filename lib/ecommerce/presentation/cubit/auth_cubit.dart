import 'package:ecommerce/ecommerce/data/firebase_auth_service.dart';
import 'package:ecommerce/ecommerce/presentation/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
checkIfLogin (){
  if(FirebaseAuth.instance.currentUser!=null){
    emit(AuthSuccessState(FirebaseAuth.instance.currentUser!));
   }
}
  Future<void> login(String email, String password) async {
    emit(AuthLoadingState());
    try {
      //IF CREATE ACCOUNT SUCCESS
      var credentials = await FirebaseAuthService.login(email, password);
      emit(AuthSuccessState(credentials!.user!)); //اجعل الحالة نجاح وغير بيانات الUSER
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      return;
    }
  }

  signup(String email, String password) async {
    emit(AuthLoadingState());
    // call api or firebase auth here
    try {
      var credentials = await FirebaseAuthService.signup(email, password);
      emit(AuthSuccessState(credentials!.user!));
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      return;
    }
  }
}
