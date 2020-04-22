import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;
  Resultado(this.pontuacao, this.reiniciarQuestionario);
  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Risco calculado de vir a ter diabetes tipo 2 dentro de 10 anos: Baixo (1 em 100)';
    } else if (pontuacao < 15) {
      return 'Risco calculado de vir a ter diabetes tipo 2 dentro de 10 anos: Pouco Elevado (1 em 25)';
    } else if (pontuacao < 20) {
      return 'Risco calculado de vir a ter diabetes tipo 2 dentro de 10 anos: Moderado (1 em 6)';
    } else if (pontuacao < 25) {
      return 'Risco calculado de vir a ter diabetes tipo 2 dentro de 10 anos: Alto (1 em 3)';
    } else {
      return 'Risco calculado de vir a ter diabetes tipo 2 dentro de 10 anos: Muito Alto (1 em 2)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.all(40),
            child: Text(
              fraseResultado,
              style: TextStyle(fontSize: 28),
            ),
          ),
        ),
        FlatButton(
          onPressed: reiniciarQuestionario,
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          textColor: Colors.green,
        )
      ],
    );
  }
}
