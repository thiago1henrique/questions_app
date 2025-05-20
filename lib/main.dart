import 'package:flutter/material.dart';
import 'package:projeto_perguntas/respostas.dart';
import './questao.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
      if(_perguntaSelecionada == 3) _perguntaSelecionada = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
      },
      {
        'texto': 'Qual é seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
      },
      {
        'texto': 'Qual é seu instrutor favorito',
        'respostas': ['Maria', 'João', 'Thiago', 'Henrique']
      },
    ];

    List<Widget> respostas = [];

    for (String textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
      respostas.add(Resposta(textoResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas,
          ],
        ),
      ),
    );
  }
}


class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}