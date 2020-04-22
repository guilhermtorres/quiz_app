import 'package:flutter/material.dart';
import 'package:quiz_app/resultado.dart';
import './questionario.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': '1) Qual é a sua idade?',
      'respostas': [
        {'texto': '< 45 anos', 'pontuação': 0},
        {'texto': '45 - 54 anos', 'pontuação': 2},
        {'texto': '55 -64 anos', 'pontuação': 3},
        {'texto': '> 64 anos', 'pontuação': 4},
      ],
    },
    {
      'texto': '2) Qual é o seu índice de massa corporal?',
      'respostas': [
        {'texto': '< 25 IMC', 'pontuação': 0},
        {'texto': '25 -30 IMC', 'pontuação': 1},
        {'texto': '30 - 32 IMC', 'pontuação': 2},
        {'texto': '> 32 IMC', 'pontuação': 3},
      ],
    },
    {
      'texto': '3) Qual é a sua medida de cintura?',
      'respostas': [
        {'texto': 'Homens: <94 cm Mulheres: <80cm', 'pontuação': 0},
        {'texto': 'Homens: 94 - 98 cm Mulheres: 80 - 84 cm', 'pontuação': 2},
        {'texto': 'Homens: 98 - 102 cm Mulheres: 84 - 88cm', 'pontuação': 3},
        {'texto': 'Homens: >102 cm Mulheres: > 88 cm', 'pontuação': 4},
      ],
    },
    {
      'texto': '4) Quantas vezes pratica exercícios físicos por pelo menos 30 minutos?',
      'respostas': [
        {'texto': '5 Vezes por semana', 'pontuação': 0},
        {'texto': '3 vezes por semana', 'pontuação': 2},
        {'texto': '1 vez por semana', 'pontuação': 3},
        {'texto': 'Nenhuma vez na semana', 'pontuação': 4},
      ],
    },
    {
      'texto': '5) Quantas vezes consome vegetais e frutas?',
      'respostas': [
        {'texto': '5 Vezes por semana', 'pontuação': 0},
        {'texto': '3 vezes por semana', 'pontuação': 2},
        {'texto': '1 vez por semana', 'pontuação': 3},
        {'texto': 'Nenhuma vez na semana', 'pontuação': 4},
      ],
    },
    {
      'texto': '6) Já tomou algum medicamento para hipertensão arterial?',
      'respostas': [
        {'texto': 'Nunca tomei', 'pontuação': 0},
        {'texto': 'Tomei por algum tempo e parei', 'pontuação': 2},
        {'texto': 'Tomo diariamente', 'pontuação': 3},
        {'texto': 'Preciso tomar, mas não tomo', 'pontuação': 4},
      ],
    },
    {
      'texto': '7) Alguma vez teve açucar elevado no sangue?',
      'respostas': [
        {'texto': 'Não! Nuca!', 'pontuação': 0},
        {'texto': 'Sim! Uma vez!', 'pontuação': 2},
        {'texto': 'Sim! Já aconteceu mais de uma vez', 'pontuação': 3},
        {'texto': 'Sim! Frequentemente', 'pontuação': 4},
      ],
    },
    {
      'texto': '8) Tem algum membro na família ou outros familiares que foram diagnosticados com diabetes (tipo 1 ou tipo2)?',
      'respostas': [
        {'texto': 'Não!', 'pontuação': 0},
        {'texto': 'Sim! Tios ou Primos', 'pontuação': 2},
        {'texto': 'Sim! Avós', 'pontuação': 3},
        {'texto': 'Sim! Pais, irmãos ou filhos', 'pontuação': 5},
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
          centerTitle: true,
          title: Text("FINDRISC: DIABETES TIPO 2"),
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
