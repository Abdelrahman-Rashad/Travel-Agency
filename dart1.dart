import 'dart:io';
void main(){
  var trip = <add_trip>[];

  while(true) {
    // title
    print('\t\t\t Travel Agency ');
    print('\t\t\t ------------- \n');
    // choose
    print('\t 1- Add Trip');
    print('\t 2- Edit Trip');
    print('\t 3- Delete Trip');
    print('\t 4- View Trip');
    print('\t 5- Search Trip');
    print('\t 6- Reverse ');
    print('\t 7- Discount ');
    // what he choose
    stdout.write('what you want (enter number) : ');
    var choose = int.parse(stdin.readLineSync());

    switch (choose) {
      case 1:
        {
          stdout.write('enter ID : ');
          var id = int.parse(stdin.readLineSync());

          stdout.write('enter location : ');
          var s = stdin.readLineSync();

          stdout.write('enter Passenger Limit : ');
          var limit = int.parse(stdin.readLineSync());

          stdout.write('enter date : ');
          var date = stdin.readLineSync();

          stdout.write('enter Price : ');
          var price = int.parse(stdin.readLineSync());

          trip.add(add_trip(id,s,price,date,limit));
          print('\t add trip is completed ... \n\n');

          break;
        }
      case 2:
        {
          stdout.write('enter id trip to change data from this trip : ');
          var id_trip = int.parse(stdin.readLineSync());
          var x=true;
          for(var i=0;i<trip.length;i++)
            {
              if(trip[i].get_id()==id_trip){
                stdout.write('enter ID : ');
                var id = int.parse(stdin.readLineSync());
                trip[i].set_id(id);
                stdout.write('enter location : ');
                var s = stdin.readLineSync();
                trip[i].set_location(s);
                stdout.write('enter Passenger Limit : ');
                var limit = int.parse(stdin.readLineSync());
                trip[i].set_limit(limit);
                stdout.write('enter date : ');
                var date = stdin.readLineSync();
                trip[i].set_date(date);
                stdout.write('enter Price : ');
                var price = int.parse(stdin.readLineSync());
                trip[i].set_price(price);

                x=false;
                print('\t edit is completed ... \n\n');
                break;
              }

            }
          if(x){
            print('\t error ... \n\n');
          }
          break;
        }
      case 3:
        {
          stdout.write('enter id trip to delete data : ');
          var id_trip=int.parse(stdin.readLineSync());
          var t=<add_trip>[];

          for(var i=0;i<trip.length;i++)
            {
              if(id_trip!=trip[i].get_id())
                {
                  t.add(trip[i]);
                }
            }
          trip=[];
          for(var i=0;i<t.length;i++)
          {
            trip.add(t[i]);
          }
          print(trip);
          break;
        }
      case 4:
        {
          trip.sort((a,b) => a.get_date().compareTo(b.get_date()));
          print(trip.toString());
          break;
        }
      case 5:
        {
          stdout.write('enter price trip to search  : ');
          var price_trip=int.parse(stdin.readLineSync());
          for(var i=0;i<trip.length;i++)
            {
              if(trip[i].get_price()==price_trip)
                {
                  print(trip[i]);
                }
            }
          break;
        }
      case 6:
        {
          stdout.write('enter id trip to reverse this trip : ');
          var id_trip = int.parse(stdin.readLineSync());
          for(var i=0;i<trip.length;i++)
            {
              if(trip[i].get_id()==id_trip)
                {
                  if(trip[i].get_limit()!=0)
                    {
                      print('Reverse is Succeeded');
                      var x=trip[i].get_limit();
                      x--;
                      trip[i].set_limit(x);
                    }
                  else
                    {
                      print('Reverse is failed (no space in trip)');
                    }
                }
            }
          break;
        }
      case 7:
        {
          for(var i=0;i<trip.length;i++)
            {
              if(trip[i].get_price()>10000)
                {
                  var x=trip[i].get_price().toDouble();
                  x = x * 0.2;
                  trip[i].set_price(x.toInt());
                  print('\t\t discount is Succeeded \n');
                }
              else
                {
                  print('\n\t\t you do not have a trips with price greater than 10000 \n');
                }
            }
          break;
        }
    }
  }
}


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




