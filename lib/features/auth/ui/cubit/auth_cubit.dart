//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/features/auth/repo/auth_repo.dart';
import 'package:flutter_application_1/features/auth/repo/auth_repo_imp.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _repo = FireBaseAuthImpl();
  AuthCubit() : super(AuthInitial());

  Future<void> Login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await _repo.login(email, password);
     // final user = FirebaseAuth.instance.currentUser;
      emit(AuthSuccess());
    } catch (error) {
      emit(AuthFailure(error.toString()));
    }
  }

  Future<void> Register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    try {
      await _repo.register(email, password, name);

      // final user = FirebaseAuth.instance.currentUser;
      // await user!.updateDisplayName(name);
      // await user.reload();
      emit(AuthSuccess());
    } catch (error) {
      emit(AuthFailure(error.toString()));
    }
  }
}
