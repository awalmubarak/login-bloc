import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators{
  final StreamController _emailController = StreamController<String>.broadcast();
  final StreamController _passwordController = StreamController<String>.broadcast();

  //Add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword =>_passwordController.sink.add;

  //change data
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e,p)=>true);


  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}
