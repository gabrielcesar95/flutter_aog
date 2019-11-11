import 'package:aog/widgets/input.widget.dart';
import 'package:aog/widgets/loading-button.widget.dart';
import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Álcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final MoneyMaskedTextController _gasCtrl = MoneyMaskedTextController();
  final MoneyMaskedTextController _alcCtrl = MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Success(
            result: 'Compensa usar Etanol',
            reset: (){},
          ),
          Input(label: 'Gasolina:', ctrl: this._gasCtrl),
          Input(label: 'Etanol:', ctrl: this._alcCtrl),
          LoadingButton(
            busy: true,
            func: () {},
            text: 'Calcular',
            invert: false,
          )
        ],
      ),
    );
  }
}
