import 'package:authentication/Repository/Api/Api.dart';
import 'package:authentication/Repository/ModelClass/LoginModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late LoginModel login;
  UserApi userApi=UserApi();
  LoginBloc() : super(LoginInitial()) {
    on<FeatchLogin>((event, emit) async{
emit( LoginBlocLoading());
try{
  login= await userApi.GetLogin(event.email, event.password);
  emit(LoginBlocLoaded());
}
    catch(e){
  emit(LoginBlocError());
  print('loginerror'+e.toString());

    }
    });
  }
}
