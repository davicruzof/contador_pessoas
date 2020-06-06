import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    debugShowCheckedModeBanner: false,
    home: Home()    
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _totalPessoas = 0;
  String _result = "";

  void _changePeople(int delta){
    setState(() {
      _totalPessoas += delta;
      if(_totalPessoas == 0){
        _result = "Vazio";
      }else{
        if(_totalPessoas > 10){
        _result = "Cheio";
      }else{
        _result = "Pode entrar !";
      }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/original.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
        ),
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text('Pessoas: $_totalPessoas', 
            style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
            onPressed: () {
              if(_totalPessoas > 0){
                _changePeople(-1);
              }
              }, 
            child: Text('-1', 
              style: TextStyle(
                fontSize: 40.0, 
                color: Colors.white
                ),
              ),
            ),
            FlatButton(
            onPressed: () {
              _changePeople(1);
              },
            child: Text('+1', 
              style: TextStyle(
                fontSize: 40.0, 
                color: Colors.white
                ),
              ),
            ),
            ],
          ),
        ),
        Text( _result , 
            style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 30.0,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    )
      ],
    );
  }
}