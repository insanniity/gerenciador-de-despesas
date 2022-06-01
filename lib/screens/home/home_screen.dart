import 'package:flutter/material.dart';
import 'package:gerenciadordedespesas/screens/home/components/speed_dial.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: buildSpeedDial(context),
    );
  }
}
