import 'package:pasarbuahapp/model/pasar_buah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailScreen extends StatelessWidget {
  final PasarBuah buah;
  DetailScreen({@required this.buah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                  ),
                  height: 360,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: buah.imageUrls.map((url) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(url),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      //FavoriteButton(),
                    ],
                  ),
                ),
              ],
            ),

            //Image.asset('images/background.jpg'),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        buah.name,
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        buah.pack,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    buah.fruitPrice,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text(buah.openDays),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(height: 8.0),
                      Text(buah.openTime),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text(buah.fruitPrice),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    buah.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Divider(color: Colors.black),
                  JumlahButton(),
                  FlatButton(
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    splashColor: Colors.yellowAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      /*...*/
                    },
                    child: Text(
                      "Tambahkan ke Basket",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//untuk menambah dan mengurangi buah
class JumlahButton extends StatefulWidget {
  @override
  _JumlahButtonState createState() => _JumlahButtonState();
}

class _JumlahButtonState extends State<JumlahButton> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.redAccent,
              size: 40,
            ),
            onPressed: _incrementCounter),
        Text(
          '$_counter',
          style: TextStyle(fontSize: 28.0),
        ),
        IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.redAccent,
              size: 40,
            ),
            onPressed: _decrementCounter),
      ],
    );
  }
}
