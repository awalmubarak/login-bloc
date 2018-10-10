import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators{
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();

  //Add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword =>_passwordController.sink.add;

  //change data
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e,p)=>true);

  submit(){
    final email = _emailController.value;
    final password = _passwordController.value;
    print("Email is $email");
    print("Password is $password");
  }

  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}
