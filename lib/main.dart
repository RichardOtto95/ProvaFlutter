import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/constants/theme_constants.dart';
import 'package:prova_flutter/app/modules/login/login_page.dart';
import 'package:prova_flutter/app/modules/notes/notes_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child("/", child: (context) => const LoginPage());
    r.module("/notes", module: NotesModule());
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Prova Flutter",
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      // darkTheme: darkTheme(),
      routerConfig: Modular.routerConfig,
    );
  }
}
