import 'package:aula5/widgets/drawer_pages.dart';
import 'package:flutter/material.dart';

class ProjetoCreate extends StatefulWidget {
  const ProjetoCreate({super.key});

  @override
  State<ProjetoCreate> createState() => _ProjetoCreateState();
}

class _ProjetoCreateState extends State<ProjetoCreate> {
  final List<String> _formValues = ['', '','',''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(''),
      ),
      drawer: DrawerPage.getWidget(context),
      body: Container(
        padding: const EdgeInsets.all(24),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
              onChanged: (String? value) {
                _formValues[0] = value ?? '';
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Descrição'),
              onChanged: (String? value) {
                _formValues[1] = value ?? '';
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Data de Inicio'),
              onChanged: (String? value) {
                _formValues[2] = value ?? '';
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Data de Termino'),
              onChanged: (String? value) {
                _formValues[3] = value ?? '';
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20)),
                child: const Text('Criar'))
          ],
        ),
      ),
    );
  }
}
