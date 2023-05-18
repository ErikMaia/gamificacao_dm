import 'package:aula5/departamento/data/model/departamento.dart';
import 'package:aula5/funcionario/presentation/crud/widgets/botao_gravar.dart';
import 'package:aula5/projeto/data/datasources/list.dart';
import 'package:aula5/projeto/data/model/projeto.dart';

import 'package:flutter/material.dart';

import '../../data/datasources/insert.dart';
import '../../data/datasources/update.dart';
import 'widgets/descricao.dart';
import 'widgets/nome.dart';

class ProjetoForm extends StatefulWidget {
  final ProjetoModel? projetoModel;

  const ProjetoForm({
    Key? key,
    this.projetoModel,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProjetoPageState createState() => _ProjetoPageState();
}

class _ProjetoPageState extends State<ProjetoForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _dataInicioController = TextEditingController();
  final TextEditingController _dataTerminoController = TextEditingController();

  @override
  void initState() {
    if (widget.projetoModel != null) {
      _nomeController.text = widget.projetoModel!.nome;
      _descricaoController.text = widget.projetoModel!.descricao;
      _dataInicioController.text = widget.projetoModel!.dataInicio;
      _dataTerminoController.text = widget.projetoModel!.dataTermino;
    }
    super.initState();
  }

  Future<void> _salvarDateInicio(formattedDate) async {
    setState(() {
      _dataInicioController.text = formattedDate;
    });
  }

  Future<void> _salvarDateTermino(formattedDate) async {
    setState(() {
      _dataTerminoController.text = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Projeto')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  NomeFuncionarioField(controller: _nomeController),
                  DescricaoFuncionarioField(controller: _descricaoController),
                  FuncionarioBotaoGravar(onPressedNovo: () {
                    _nomeController.clear();
                    _descricaoController.clear();
                  }, onPressed: () async {
                    FocusScope.of(context).unfocus();

                    if (_formKey.currentState!.validate()) {
                      if (widget.projetoModel!.projetoID == null) {
                        await ProjetoInsertDataSource().insert(
                          projeto: ProjetoModel(
                            nome: _nomeController.text,
                            descricao: _descricaoController.text,
                          ),
                        );
                      } else {
                        await DepartamentoUpdateDataSource().update(
                          departamentoModel: DepartamentoModel(
                            departamentoID:
                                widget.departamentoModel!.departamentoID,
                            nome: _nomeController.text,
                            descricao: _descricaoController.text,
                          ),
                        );
                      }
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}