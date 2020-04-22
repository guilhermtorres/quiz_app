import 'package:flutter/material.dart';
import 'package:quiz_app/resultado.dart';
import './questionário.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuação': 10},
        {'texto': 'Branco', 'pontuação': 5},
        {'texto': 'Azul', 'pontuação': 3},
        {'texto': 'Vermelho', 'pontuação': 1},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'Garça', 'pontuação': 1},
        {'texto': 'Lemore', 'pontuação': 3},
        {'texto': 'Aguia', 'pontuação': 5},
        {'texto': 'Pintassilgo', 'pontuação': 10},
      ],
    },
    {
      'texto': 'Qual é a sua banda favorita?',
      'respostas': [
        {'texto': 'CPM', 'pontuação': 3},
        {'texto': 'Blink', 'pontuação': 1},
        {'texto': 'Red Hot', 'pontuação': 5},
        {'texto': 'Queen', 'pontuação': 10},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
