import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class Rico extends StatefulWidget {
  @override
  _RicoState createState() => _RicoState();
}

//classe interna do tipo State, que recebe a Class Rico
class _RicoState extends State<Rico> {

  double _contador = 6;

  void _showDialog()
  {
    showDialog(
        context:context,
    builder:  (BuildContext context) {
      return AlertDialog(
        title: Text("GAME OVER"),
        content: Text("Você Perdeu Tudo - You Loose!!"),
        actions: <Widget>[
         new FlatButton(onPressed: () => exit(0),
              child: Text("Fechar")
           ),
          ],
        );
      },
    );
  }//ShowDialog

  void _maisGrana()
  {
    setState(() {
       //método responsável pela atualização(valores) da nossa tela

      Random sorteio = new Random();

      int min = 1;
      int max = 10;
      int r = min + sorteio.nextInt(max - min);

        if(r == 1)
            {
            _contador = _contador * 0 ;
            }
          else if(r == 2) {
            _contador = _contador * 2;
            }
          else if(r == 3)
            {
            _contador = _contador * 5;
            }
          else if(r == 4)
            {
            _contador = _contador / 2;
            }
          else if(r == 5)
            {
            _contador = _contador + 10;
            }
          else if(r == 5)
            {
             _contador = _contador + 100;
            }
          else if(r == 5)
            {
            _contador = _contador + 1000;
            }
          if(_contador <= 0)
            {
              _showDialog();
              _contador = 10;
            }
    });
  }



  @override
  Widget build(BuildContext context) {
    //Cria a tela(ui)
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Center(child: Text("Rico App",
        style: TextStyle(
          color: Colors.black87,
        ),
        )),
        backgroundColor: Colors.indigo,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              //Título do App
              Expanded(
                child: Center(
                  child: Text("Venha Ficar Rico!!!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              //valor em dinheiro
              Expanded(
                child: Center(
                  child: Text("R\$ $_contador",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: _contador  >= 100 ? Colors.yellow : Colors.white,
                    ),
                  ),
                ),
              ),

              //Botão de ação
              Expanded(
                child: Center(
                  child: FlatButton(
                      onPressed: _maisGrana,
                      color: Colors.black,
                      textColor: Colors.white,

                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text("Mais Grana!!!",
                       style: TextStyle(
                         fontSize: 20,
                       ),
                        ),
                    ),
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
