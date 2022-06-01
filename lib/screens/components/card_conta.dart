import 'package:flutter/material.dart';
import 'package:gerenciadordedespesas/screens/conta/conta_screen.dart';

import '../../models/conta.dart';

Widget cardConta (BuildContext context, Conta conta){
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) =>  ContaScreen(id: conta.id))
      );
    },
    child: Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      width: 250,
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(8),
        color: Colors.blue,
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000),
            blurRadius: 10,
            spreadRadius: 4,
            offset: Offset(0.0, 8.0)
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top:14,
            right: 12,
            child: Text(conta.titulo.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          const Positioned(
            top:63,
            left: 16,
            child: Text('Saldo em conta:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top:81,
            left: 16,
            child: Text('R\$ ${conta.saldo.toString()}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}