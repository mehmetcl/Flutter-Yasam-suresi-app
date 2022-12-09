import 'package:flutter/material.dart';
import 'package:lifexpectancyapp/constants.dart';
import 'package:lifexpectancyapp/user_data.dart';
import 'calculate.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SONUC',
          style: standartTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
                child:
                    Text(Calculate(_userData).calculate().round().toString(), style: standartTextStyle)),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Geri Dön',
                  style: standartTextStyle,
                )),
          ),
        ],
      ),
    );
  }
}
