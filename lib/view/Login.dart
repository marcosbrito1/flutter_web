import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:go_router/go_router.dart';
import '../component/Mensagem.dart';
import '../settings/Token.dart';


class loginPage extends StatefulWidget {


  @override
  _loginPageState createState() => _loginPageState();
}


class _loginPageState extends State<loginPage> {
  String textoToken = "";


  @override
  void initState() {
    super.initState();
  }

  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  TextEditingController tecuser = new TextEditingController();
  TextEditingController tecpass = new TextEditingController();
  TextEditingController tecfili = new TextEditingController();
  SessionManager sessionManager = SessionManager();




  void setToken(String value) async {
    await sessionManager.set("token", value);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Web'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _key,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline,size: 300.0),
              Text("Dados de Acesso", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),textAlign: TextAlign.center,),
              SizedBox(height: 4,),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Filial", labelStyle: TextStyle(color: Colors.black, fontSize: 20.0,), border: OutlineInputBorder()),
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  textAlign: TextAlign.center,
                  controller: tecfili,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Informe a filial!";
                    }
                  }
              ),
              SizedBox(height: 8,),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Usuário", labelStyle: TextStyle(color: Colors.black, fontSize: 20.0,), border: OutlineInputBorder()),
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  textAlign: TextAlign.center,
                  controller: tecuser,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Informe o usuário!";
                    }
                  }
              ),
              SizedBox(height: 8,),
              TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(labelText: "Senha", labelStyle: TextStyle(color: Colors.black, fontSize: 20.0), border: OutlineInputBorder()),
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  textAlign: TextAlign.center,
                  controller: tecpass,
                  obscureText: true,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Informe a senha!";
                    }
                  }
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                    child: Text("Entrar", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 25.0),),
                    onPressed: () async{
                      if(_key.currentState!.validate()){
                        try {
                          textoToken = await Token().createToken();
                          if(textoToken.isNotEmpty){
                            setToken(await textoToken);
                            context.go('/home');
                          }
                        } catch (e, s) {
                          Mensagem().alerta("Erro de autenticação, verifique:\n1 - Os dados inseridos\n2 - A conexão com a internet", context);
                          print("Erro de autenticação");
                          print(e);
                          print(s);
                        }

                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}






