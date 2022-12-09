import 'package:lifexpectancyapp/user_data.dart';
import 'user_data.dart';
class Calculate  {

  UserData _userData;
Calculate(this._userData);

double calculate(){
  double result;
   result=80+_userData.sportsDay-_userData.smoking;
   result=result+(_userData.userlength/_userData.kilogram);
   result=_userData.genderSelection=='KADIN'?result+20:result;
   return result;

}

}