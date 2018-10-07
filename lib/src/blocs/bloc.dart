import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators{
  final StreamController _emailController = StreamController<String>();
  final StreamController _passwordController = StreamController<String>();

  //Add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword =>_passwordController.sink.add;

  //change data
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);


  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();