import 'package:prova_flutter/app/modules/notes/notes_page.dart';
import 'package:prova_flutter/app/modules/notes/notes_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotesModule extends Module {
  @override
  binds(i) {
    i.addSingleton<NotesStore>(NotesStore.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (context) => const NotesPage());
  }
}
