import 'package:prova_flutter/app/modules/login/login_Page.dart';
import 'package:prova_flutter/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  binds(i) {
    i.addSingleton(LoginStore.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (context) => const LoginPage());
  }
}
