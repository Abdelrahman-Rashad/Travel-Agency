import 'dart:io';
import 'add_trip.dart';
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
          var temp=<add_trip>[];
          stdout.write('enter id trip to delete data : ');
          var id_trip=int.parse(stdin.readLineSync());
          temp=delete(id_trip, trip);
          trip=[];
          for(var i=0;i<temp.length;i++) {
            trip.add(temp[i]);
          }

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
          var check=false;
          for(var i=0;i<trip.length;i++)
            {
              if(trip[i].get_price()>10000)
                {
                  var x=trip[i].get_price().toDouble();
                  x = x * 0.2;
                  trip[i].set_price(x.toInt());
                  check=true;
                }
            }
          if(check) {
            print('\t\t discount is Succeeded \n');
          }
          else
            {
              print('\n\t\t you do not have a trips with price greater than 10000 \n');
            }
          break;
        }
    }
  }
}
List<add_trip> delete(int id_trip , List <add_trip> trip){
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
  print('\t\t delete is Succeeded \n');
  return trip;
}






