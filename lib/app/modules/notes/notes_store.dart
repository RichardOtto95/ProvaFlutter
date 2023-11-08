import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notes_store.g.dart';

class NotesStore = _NotesStoreBase with _$NotesStore;

abstract class _NotesStoreBase with Store {
  @observable
  ObservableList<String>? texts;
  @observable
  TextEditingController textController = TextEditingController();
  @observable
  SharedPreferences? prefs;

  @action
  Future<void> loadTexts() async {
    prefs = await SharedPreferences.getInstance();

    List<String> prefTexts = prefs!.getStringList("TEXTS") ?? [];

    await Future.delayed(const Duration(seconds: 2));

    texts = prefTexts.asObservable();
  }

  @action
  Future<void> saveText() async {
    if (texts == null) return;

    prefs ??= await SharedPreferences.getInstance();

    texts!.add(textController.text);

    textController.clear();

    await prefs!.setStringList("TEXTS", texts!.toList());
  }

  @action
  Future<void> editText(String newText, int index) async {
    if (texts == null) return;

    prefs ??= await SharedPreferences.getInstance();

    texts![index] = newText;

    await prefs!.setStringList("TEXTS", texts!.toList());
  }

  @action
  Future<void> deleteText(int index) async {
    if (texts == null) return;

    prefs ??= await SharedPreferences.getInstance();

    texts!.removeAt(index);

    await prefs!.setStringList("TEXTS", texts!.toList());
  }
}
