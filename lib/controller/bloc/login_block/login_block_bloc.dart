// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_app/controller/api/loginapi.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_block_event.dart';
part 'login_block_state.dart';

class LoginBlockBloc extends Bloc<LoginBlockEvent, LoginBlockState> {
  final AuthService authService;

  LoginBlockBloc({required this.authService}) : super(LoginBlockInitial()) {
    on<LogginSubmitted>(_onLogInButtonPressed);
  }

  Future<void> _onLogInButtonPressed(
      LogginSubmitted event, Emitter<LoginBlockState> emit) async {
    if (event.username.isEmpty || event.password.isEmpty) {
      emit(Loginfailed(error: 'Please enter both username and password'));
      return;
    }

    emit(LoginBlockloading());

    try {
      await authService.login(
          username: event.username, password: event.password);

      // ignore: unused_local_variable
      final prefs = await SharedPreferences.getInstance();
      // await prefs.setString('auth_token');
      emit(LoginSuccess());
    } catch (e) {
      emit(Loginfailed(error: e.toString()));
    }
  }
}
