// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:prova_flutter/app/services/web_service.dart';
import 'package:prova_flutter/shared/utilities.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/widgets/data_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController usernameControler = TextEditingController();

  final TextEditingController passwordControler = TextEditingController();

  void handleLogin() async {
    if (formKey.currentState!.validate()) {
      final OverlayEntry entry = getLoadEntry();

      Overlay.of(context).insert(entry);

      Response response = await WebService.get(
          WebService.getUri("users?username=${usernameControler.text}"));

      List body = jsonDecode(response.body);

      if (body.isNotEmpty) {
        Map user = body.first;

        if (user["password"] != passwordControler.text) {
          showCustomSnackBar(
            context,
            "Senha incorreta, tente novamente",
          );

          entry.remove();

          return;
        }

        showCustomSnackBar(
          context,
          "Usuário ${user["username"]} logado com sucesso",
        );

        Modular.to.pushReplacementNamed("/notes");
      } else {
        Response postResponse = await WebService.post(
          WebService.getUri("/users"),
          body: jsonEncode({
            "username": usernameControler.text,
            "password": passwordControler.text,
          }),
        );

        if (![201, 200].contains(postResponse.statusCode)) {
          showCustomSnackBar(
            context,
            "Erro ao criar usuário: ${postResponse.body}",
          );
          entry.remove();
          return;
        }

        showCustomSnackBar(
          context,
          "Usuário ${(jsonDecode(postResponse.body) as Map)["username"]} criado com sucesso",
        );

        Modular.to.pushReplacementNamed("/notes");
      }
      entry.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          getColors(context).primary,
          getColors(context).secondary,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: maxWidth(context)),
              const Spacer(flex: 5),
              DataInput(
                label: "Usuários",
                autofocus: true,
                controller: usernameControler,
                icon: Icons.person,
                validator: (value) {
                  if (value == null) {
                    return null;
                  }
                  if (value.isEmpty) {
                    return "Este campo não pode ser vazio!";
                  }
                  if (value[value.length - 1] == " ") {
                    return "Não pode terminar com espaço!";
                  }
                  return null;
                },
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
              ),
              DataInput(
                label: "Senha",
                icon: Icons.lock_rounded,
                controller: passwordControler,
                validator: (value) {
                  if (value == null) {
                    return null;
                  }
                  if (value.isEmpty) {
                    return "Este campo não pode ser vazio!";
                  }
                  if (value.length < 2) {
                    return "O mínimo é dois caracteres!";
                  }
                  return null;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z0-9]"),
                  ),
                  LengthLimitingTextInputFormatter(20),
                ],
                onFieldSubmitted: (value) => handleLogin(),
              ),
              vSpace(15),
              ElevatedButton(
                onPressed: handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff44BD6E),
                  minimumSize: const Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Entrar",
                  style: getStyles(context)
                      .labelLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const Spacer(flex: 3),
              TextButton(
                onPressed: () async {
                  final Uri url = Uri.parse('https://www.google.com.br/');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: Text(
                  "Política de Privacidade",
                  style: getStyles(context).bodySmall?.copyWith(
                        color: Colors.white.withOpacity(.8),
                      ),
                ),
              ),
              vSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}
