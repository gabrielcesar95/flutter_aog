import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:aog/widgets/input.widget.dart';
import 'package:aog/widgets/loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  MoneyMaskedTextController gasCtrl = MoneyMaskedTextController();
  MoneyMaskedTextController alcCtrl = MoneyMaskedTextController();
  bool busy = false;
  Function submitFunc;

  SubmitForm({
    @required this.gasCtrl,
    @required this.alcCtrl,
    @required this.busy,
    @required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          child: Input(label: 'Gasolina:', ctrl: this.gasCtrl),
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
        ),
        Padding(
          child: Input(label: 'Etanol:', ctrl: this.alcCtrl),
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
        ),
        SizedBox(
            height: 25,
        ),
        LoadingButton(
          busy: this.busy,
          func: this.submitFunc,
          text: 'Calcular',
          invert: false,
        ),
      ],
    );
  }
}
