// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesStore on _NotesStoreBase, Store {
  late final _$textsAtom =
      Atom(name: '_NotesStoreBase.texts', context: context);

  @override
  ObservableList<String>? get texts {
    _$textsAtom.reportRead();
    return super.texts;
  }

  @override
  set texts(ObservableList<String>? value) {
    _$textsAtom.reportWrite(value, super.texts, () {
      super.texts = value;
    });
  }

  late final _$textControllerAtom =
      Atom(name: '_NotesStoreBase.textController', context: context);

  @override
  TextEditingController get textController {
    _$textControllerAtom.reportRead();
    return super.textController;
  }

  @override
  set textController(TextEditingController value) {
    _$textControllerAtom.reportWrite(value, super.textController, () {
      super.textController = value;
    });
  }

  late final _$prefsAtom =
      Atom(name: '_NotesStoreBase.prefs', context: context);

  @override
  SharedPreferences? get prefs {
    _$prefsAtom.reportRead();
    return super.prefs;
  }

  @override
  set prefs(SharedPreferences? value) {
    _$prefsAtom.reportWrite(value, super.prefs, () {
      super.prefs = value;
    });
  }

  late final _$loadTextsAsyncAction =
      AsyncAction('_NotesStoreBase.loadTexts', context: context);

  @override
  Future<void> loadTexts() {
    return _$loadTextsAsyncAction.run(() => super.loadTexts());
  }

  late final _$saveTextAsyncAction =
      AsyncAction('_NotesStoreBase.saveText', context: context);

  @override
  Future<void> saveText() {
    return _$saveTextAsyncAction.run(() => super.saveText());
  }

  late final _$editTextAsyncAction =
      AsyncAction('_NotesStoreBase.editText', context: context);

  @override
  Future<void> editText(String newText, int index) {
    return _$editTextAsyncAction.run(() => super.editText(newText, index));
  }

  late final _$deleteTextAsyncAction =
      AsyncAction('_NotesStoreBase.deleteText', context: context);

  @override
  Future<void> deleteText(int index) {
    return _$deleteTextAsyncAction.run(() => super.deleteText(index));
  }

  @override
  String toString() {
    return '''
texts: ${texts},
textController: ${textController},
prefs: ${prefs}
    ''';
  }
}
