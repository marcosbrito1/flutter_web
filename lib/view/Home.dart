import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:go_router/go_router.dart';

class homePage extends StatefulWidget {

  @override
  _homePageState createState() => _homePageState();
}


class _homePageState extends State<homePage> {

  @override
  void initState() {
    super.initState();
    iniciar();
  }

String textoToken = "";
void iniciar() async{
  textoToken =  await SessionManager().get("token");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                radius: 30.0,
                child: Icon(Icons.school, size: 60.0,),
                backgroundColor: Colors.blueGrey,
              ),
              decoration: BoxDecoration(color: Colors.grey, ),

            ),

            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              subtitle: Text("Deslogar do sistema..."),
              trailing: Icon(Icons.arrow_forward),
              onTap:() async{
                await SessionManager().destroy();
                   context.go("/");
              },
            ),
          ],
        ),
      ),
       );
  }
}
