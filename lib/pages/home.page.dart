import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:aog/submit-form.dart';
import 'package:aog/widgets/logo.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  MoneyMaskedTextController _gasCtrl = MoneyMaskedTextController();
  MoneyMaskedTextController _alcCtrl = MoneyMaskedTextController();
  bool _busy = false;
  bool _completed = false;
  String _resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: this._color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? Success(
                    reset: reset,
                    result: _resultText,
                  )
                : SubmitForm(
                    gasCtrl: _gasCtrl,
                    alcCtrl: _alcCtrl,
                    busy: this._busy,
                    submitFunc: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alc = _alcCtrl.numberValue / 100;
    double gas = _gasCtrl.numberValue / 100;
    double res = alc / gas;

    setState(() {
      this._color = Colors.deepPurpleAccent;
      this._completed = false;
      this._busy = true;
    });

    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (res >= .7) {
          this._resultText = 'Compensa usar Gasolina';
        } else {
          this._resultText = 'Compensa usar Etanol';
        }

        this._completed = true;
        this._busy = false;
      });
    });
  }

  reset() {
    setState(() {
      this._color = Colors.deepPurple;
      this._gasCtrl = MoneyMaskedTextController();
      this._alcCtrl = MoneyMaskedTextController();
      this._completed = false;
      this._busy = false;
    });
  }
}
