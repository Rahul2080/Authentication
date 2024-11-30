import 'package:authentication/Repository/Api/Api.dart';
import 'package:authentication/Repository/ModelClass/SignUpModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late SignUpModel SignUp;
  UserApi userApi=UserApi();
  SignUpBloc() : super(SignUpInitial()) {
    on<FeatchSignUp>((event, emit) async{
emit(SignUBlocLoading());
try{
  SignUp = await userApi.GetSignUp(event.name, event.email, event.state, event.city, event.locality, event.password);
  emit(SignUBlocLoaded());


}
    catch(e){
  emit(SignUBlocError());


    }


    });
  }
}
