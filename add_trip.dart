import 'dart1.dart';
class add_trip{
  int _id;
  String _location;
  int _limit;
  String _date;
  int _price;

  add_trip(this._id,this._location,this._price,this._date,this._limit);
  void set_id(int id){
    _id=id;
  }
  int get_id(){
    return _id;
  }
  void set_location(String location){
    _location=location;
  }
  String get_location(){
    return _location;
  }
  void set_limit(int limit){
    _limit=limit;
  }
  int get_limit(){
    return _limit;
  }
  void set_date(String date){
    _date=date;
  }
  String get_date(){
    return _date;
  }
  void set_price(int price){
    _price=price;
  }
  int get_price(){
    return _price;
  }
  @override
  String toString(){
    return '${_id} \t,${_location} \t,${_limit} \t,${_date} \t,${_price} \n';
  }

}