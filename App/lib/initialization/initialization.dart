import 'package:aula5/settings/presentation/mobx/configuracoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

//fabiano
import '../cliente/presentation/list.dart';
import '../departamento/presentation/list.dart';
import '../empresa/presentation/list.dart';
import '../funcionario/presentation/list.dart';
import '../tarefa/presentation/list.dart';

// falta fazer

import '../pages/projeto/projeto_list.dart';

//nao mecher
import '../settings/presentation/configuracoes.dart';
import '../shared/functions/dark_mode_control.dart';

// ignore: must_be_immutable
class TaskManagerApp extends StatelessWidget {
  late SettingsStore _settingsStore;

  TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    _settingsStore = Modular.get<SettingsStore>();
    getDarkModeStatus().then((darkModeStatus) {
      _settingsStore.toggleDarkModeStatus(status: darkModeStatus);
    });

    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Pfe',
        routes: {
          '/': (context) => const FuncionarioList(),
          '/funcionario': (context) => const FuncionarioList(),
          '/departamento': (context) => const DepartamentoList(),
          '/projeto': (context) => const ProjetoList(),
          '/cliente': (context) => const ClienteList(),
          '/tarefa': (context) => const TarefaList(),
          '/empresa': (context) => const EmpresaList(),
          '/configuracao': (context) => SettingsPage(),
        },
        theme: _settingsStore.darkModeStatus
            ? ThemeData.dark()
            : ThemeData.light(),
      );
    });
  }
}
