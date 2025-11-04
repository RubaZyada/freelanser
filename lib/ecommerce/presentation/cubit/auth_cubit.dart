
import 'package:ecommerce/ecommerce/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  Future<void> login(String email, String password) async {
    emit(AuthLoadingState());
    // call api or firebase auth here
    await Future.delayed(Duration(seconds: 2)); // simulate network delay
    if(password.length < 8){
      emit(AuthErrorState ('Wrong email or password'));
      return;
    }
    emit(AuthSuccessState ( email));

  }
  signup(String email, String password) async {
    emit(AuthLoadingState());
    // call api or firebase auth here
    await Future.delayed(Duration(seconds: 2)); // simulate network delay
    if(password.length < 8){
      emit(AuthErrorState ('Password must be at least 8 characters long'));
      return;
    }
    emit(AuthSuccessState ( email));
  }
}