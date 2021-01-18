import 'package:flutter/material.dart';

import 'button.dart';

class FormRepository extends StatefulWidget {
  FormRepository({Key key, @required this.onSearch}) : super(key: key);
  final Function onSearch;
  @override
  _FormRepositoryState createState() => _FormRepositoryState();
}

class _FormRepositoryState extends State<FormRepository> {
  final _formKey = GlobalKey<FormState>();
  var _search = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value){
              setState(() {
                _search = value;
              });
            },
            autocorrect: true,
            decoration: const InputDecoration(
              hintText: 'Buscar',
            ),
            validator: (value){
              if(value.isEmpty){
                return 'Preencha o campo';
              }
              return null;
            },
          ),
          Button(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                widget.onSearch(_search);
              }
              return null;
            },
            text: 'Buscar',
          ),
        ],
      ),
    );
  }
}
