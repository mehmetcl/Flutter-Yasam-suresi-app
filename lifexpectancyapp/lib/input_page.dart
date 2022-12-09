import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifexpectancyapp/constants.dart';
import 'package:lifexpectancyapp/resultpage.dart';
import 'package:lifexpectancyapp/user_data.dart';
import 'MyWidget.dart';
import 'mycontainer.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? genderSelection;
  double smoking = 0.0;
  double sportsDay = 0.0;
  int userlength = 170;
  int kilogram = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              myonPress: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hafta da Kaç gün Spor yapıyorsunuz ?',
                    style: standartTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    sportsDay.round().toString(),
                    style: blueTextStyle,
                  ),
                  Expanded(
                    child: Slider.adaptive(
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: sportsDay,
                      onChanged: (double newsportsValue) {
                        setState(() {
                          sportsDay = newsportsValue.roundToDouble();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              myonPress: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Günde Kaç Sigara İçiyorsunuz ?',
                    style: standartTextStyle,
                  ),
                  Text(
                    smoking.toString(),
                    style: blueTextStyle,
                  ),
                  Expanded(
                    child: Slider.adaptive(
                      min: 0,
                      max: 30,
                      divisions: 30,
                      value: smoking,
                      onChanged: (double newValue) {
                        setState(() {
                          smoking = newValue.roundToDouble();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    myonPress: () {
                      setState(() {
                        genderSelection = 'KADIN';
                      });
                    },
                    mycolors: genderSelection == 'KADIN'
                        ? Colors.lightGreenAccent
                        : Colors.white,
                    child: MyColumn(
                      gender: 'KADIN',
                      myicon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    myonPress: () {
                      setState(() {
                        genderSelection = 'ERKEK';
                      });
                    },
                    mycolors: genderSelection == 'ERKEK'
                        ? Colors.lightGreenAccent
                        : Colors.white,
                    child: MyColumn(
                      gender: 'ERKEK',
                      myicon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const StadiumBorder(
                  side: BorderSide(
                      width: 2,
                      strokeAlign: StrokeAlign.center,
                      color: Colors.greenAccent),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      UserData(
                        genderSelection = genderSelection,
                        smoking = smoking,
                        sportsDay = sportsDay,
                        userlength = userlength,
                        kilogram = kilogram,
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                'HESAPLA',
                style: standartTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label,
            style: standartTextStyle,
          ),
        ),
        const SizedBox(height: 10),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label == 'BOY' ? '$userlength' : '$kilogram',
            style: blueTextStyle,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.black12,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? userlength++ : kilogram++;
                  });
                },
                child:
                    const Icon(FontAwesomeIcons.plus, color: Colors.blueGrey),
              ),
            ),
            const SizedBox(height: 5),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.black12,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (label == 'BOY' && userlength > 100) {
                      userlength--;
                    } else if (label == 'KİLO' && kilogram > 10) {
                      kilogram--;
                    }
                  });
                },
                child:
                    const Icon(FontAwesomeIcons.minus, color: Colors.blueGrey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
