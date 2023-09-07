import 'package:flutter/material.dart';

class Mensagem{
  bool? _status=false;


  void alerta(String mensagem, context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              clipBehavior: Clip.none, children: <Widget>[
              Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              Text(""+mensagem),
            ],
            ),
          );
        });
  }

  void Sucesso(String mensagem, context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Operação concluída com sucesso'),
            content: Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 10),
                Text('Você realizou a operação com êxito.'),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }



  Future<bool?> confirmar(context) async {
    _status = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Deseja realmente excluir?'),
            content: Row(
              children: [
                Icon(Icons.delete, color: Colors.red),
                SizedBox(width: 10),
                Text('Esta ação não pode ser desfeita.'),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.pop(context, _status);
                },
              ),
              TextButton(
                child: Text('Confirmar'),
                onPressed: () {
                  _status = true;
                  Navigator.pop(context, _status);
                },
              ),
            ],
          );
        });
    return _status;
  }
}