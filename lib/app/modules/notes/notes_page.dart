import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/modules/notes/notes_store.dart';
import 'package:flutter/material.dart';
import 'package:prova_flutter/shared/widgets/custom_card.dart';
import 'package:prova_flutter/shared/widgets/data_input.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/utilities.dart';

class NotesPage extends StatefulWidget {
  final String title;
  const NotesPage({Key? key, this.title = 'NotesPage'}) : super(key: key);
  @override
  NotesPageState createState() => NotesPageState();
}

class NotesPageState extends State<NotesPage> {
  final store = Modular.get<NotesStore>();

  final FocusNode textFocus = FocusNode();

  @override
  void initState() {
    store.loadTexts();
    textFocus.addListener(() {
      if (!textFocus.hasFocus && ModalRoute.of(context)!.isCurrent) {
        textFocus.requestFocus();
      }
    });
    super.initState();
  }

  showShureDialog(BuildContext context, String text, int index) {
    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext dContext) {
        return AlertDialog(
          title: const Text("Excluir texto?"),
          content: Text(
            "$text \n\n"
            "Tem certeza que deseja excluir este texto?",
            style: getStyles(context).displayMedium,
          ),
          actions: [
            TextButton(
              child: Text(
                "Cancelar",
                style: getStyles(context).displayMedium,
              ),
              onPressed: () => Modular.to.pop(),
            ),
            TextButton(
              child: Text(
                "Ok",
                style: getStyles(context).displayMedium,
              ),
              onPressed: () async {
                final entry = getLoadEntry();
                Overlay.of(context).insert(entry);
                await store
                    .deleteText(index)
                    .then((value) => entry.remove())
                    .onError((error, stackTrace) {
                  entry.remove();
                  showCustomSnackBar(context, error.toString());
                });
                Modular.to.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DecoratedBox(
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
          body: Column(
            children: [
              hSpace(maxWidth(context)),
              const Spacer(),
              Expanded(
                flex: 5,
                child: CustomCard(
                  // height: 380,
                  width: 350,
                  child: Observer(
                    builder: (context) {
                      if (store.texts == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (store.texts!.isEmpty) {
                        return const Center(
                          child: Text(
                            "Sem textos registrados!",
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }
                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Material(
                          color: Colors.transparent,
                          child: Column(
                              children: List.generate(
                            store.texts!.length,
                            (index) => TextTile(
                              text: store.texts![index],
                              index: index,
                              onDelete: (index) => showShureDialog(
                                context,
                                store.texts![index],
                                index,
                              ),
                              onEditComplete: (value) => store
                                  .editText(
                                    value,
                                    index,
                                  )
                                  .then((value) => textFocus.requestFocus()),
                            ),
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Spacer(),
              DataInput(
                autofocus: true,
                textAlign: TextAlign.center,
                hintText: "Digite seu texto",
                controller: store.textController,
                focus: textFocus,
                onFieldSubmitted: (value) {
                  if (value.isEmpty) {
                    showCustomSnackBar(
                        context, "Digite um texto para adicionar");
                    textFocus.requestFocus();
                    return;
                  }
                  final entry = getLoadEntry();
                  Overlay.of(context).insert(entry);
                  try {
                    store.saveText().then((value) => entry.remove());
                    textFocus.requestFocus();
                  } catch (e) {
                    entry.remove();
                    showCustomSnackBar(context, e.toString());
                  }
                },
              ),
              const Spacer(),
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

class TextTile extends StatelessWidget {
  const TextTile({
    super.key,
    required this.text,
    required this.index,
    required this.onDelete,
    required this.onEditComplete,
  });

  final String text;
  final int index;
  final void Function(int index) onDelete;
  final Future<void> Function(String value) onEditComplete;

  displayInputDialog(context) {
    TextEditingController controller = TextEditingController(text: text);

    conclude() async {
      final entry = getLoadEntry();
      Overlay.of(context).insert(entry);
      try {
        await onEditComplete(controller.text).then((value) => entry.remove());
        Modular.to.pop();
      } catch (e) {
        entry.remove();
        showCustomSnackBar(context, e.toString());
      }
    }

    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Editar texto"),
          content: TextFormField(
            controller: controller,
            style: getStyles(context).displayMedium,
            autofocus: true,
            onFieldSubmitted: (value) => conclude(),
          ),
          actions: [
            TextButton(
              child: Text(
                "Cancelar",
                style: getStyles(context).displayMedium,
              ),
              onPressed: () => Modular.to.pop(),
            ),
            TextButton(
              onPressed: conclude,
              child: Text(
                "Salvar",
                style: getStyles(context).displayMedium,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: getColors(context).onSurface.withOpacity(.5),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: getStyles(context).displayLarge,
            ),
          ),
          IconButton(
            onPressed: () => displayInputDialog(context),
            icon: Icon(
              Icons.edit,
              color: getColors(context).onBackground,
            ),
          ),
          IconButton(
            onPressed: () => onDelete(index),
            icon: Icon(
              Icons.highlight_remove_sharp,
              color: getColors(context).error,
            ),
          ),
        ],
      ),
    );
  }
}
