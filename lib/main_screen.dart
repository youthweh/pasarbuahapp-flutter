import 'package:flutter/material.dart';
import 'package:pasarbuahapp/detail_screen.dart';
import 'package:pasarbuahapp/model/pasar_buah.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // do something
            },
          )
        ],
        title: Text(
          'Pasar Buah',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      //backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12.0, top: 18.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Cari Buah atau Sayurs",
                      contentPadding: EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.redAccent,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Image.asset('images/background.jpg'),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            //child: Image.asset('name'),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.orangeAccent,
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                        )),
                    SizedBox(height: 8.0),
                    Text(
                      'Buah',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.orangeAccent,
                        child: Icon(
                          Icons.access_time,
                          color: Colors.black,
                        )),
                    SizedBox(height: 8.0),
                    Text(
                      'Sayur',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.orangeAccent,
                        child: Icon(
                          Icons.monetization_on,
                          color: Colors.black,
                        )),
                    SizedBox(height: 8.0),
                    Text(
                      'Variasi',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              //padding: const EdgeInsets.all(18),
              children: pasarBuahList.map((buah) {
                return FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(buah: buah);
                    }));
                  },
                  child: Container(
                    height: 118,
                    //color: Colors.amber[600],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 100,
                            width: 140,
                            //margin: const EdgeInsets.all(0),
                            child: //Image.asset(buah.imageAsset),
                                Image.network(buah.imageUrl)),
                        Container(
                          padding: EdgeInsets.all(2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                buah.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                buah.pack,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black45),
                              ),
                              Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        buah.fruitPrice,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      FavoriteButton(),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(0),
                          //color: Colors.green,
                          child: JumlahButton(),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.redAccent,
            ),
            onPressed: _incrementCounter),
        Text('$_counter'),
        IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.redAccent,
            ),
            onPressed: _decrementCounter),
      ],
    );
  }
}

var pasarBuahList = [
  PasarBuah(
    name: 'Pisang',
    color: '#4286f4',
    pack: 'Indonesia - x6 pack',
    description:
        'Pisang mengandung banyak serat dan antioksidan yang bermanfaat bagi tubuh. Vitaminnya pun banyak, seperti kalium, vitamin B6, vitamin C, magnesium, tembaga, mangan, karbohidrat, protein dan sedikit lemak. ',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    fruitPrice: 'Rp 25000',
    imageAsset: 'images/banana.png',
    imageUrl:
        'https://www.freepngimg.com/thumb/banana/3-2-banana-png-picture.png',
    imageUrls: [
      'https://www.freepngimg.com/thumb/banana/3-2-banana-png-picture.png',
    ],
  ),
  PasarBuah(
    name: 'Nenas',
    pack: 'Indonesia - x8 pack',
    description:
        'Nanas mampu berfungsi sebagai buah yang dapat menekan nafsu makan secara alami. Sehingga saat kamu rajin makan nanas selama seminggu, berat badanmu bisa turun hingga 3 kilogram. ',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    fruitPrice: 'Rp 12000',
    imageAsset: 'images/pineapple.png',
    imageUrl: 'https://i.dlpng.com/static/png/6830886_preview.png',
    imageUrls: [
      'https://i.dlpng.com/static/png/6830886_preview.png',
      'https://i.dlpng.com/static/png/6591873_preview.png',
    ],
  ),
  PasarBuah(
    name: 'Apel',
    pack: 'Indonesia - x12 pack',
    description:
        'Apel  atau dalam bahasa Inggris disebut apple adalah salah satu jenis buah-buahan yang cukup populer di berbagai belahan dunia, termasuk Indonesia. Buah yang memiliki nama latin Malus domestica ini biasa dijadikan pencuci mulut, alias makanan penutup.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    fruitPrice: 'Rp 20000',
    imageAsset: 'images/apple.png',
    imageUrl: 'https://pngimg.com/uploads/apple/apple_PNG12436.png',
    imageUrls: [
      'https://pngimg.com/uploads/apple/apple_PNG12436.png',
    ],
  ),
  PasarBuah(
    name: 'Mentimun',
    pack: 'Indonesia - x6 pack',
    description:
        'mentimun merupakan sumber mineral yang dapat membantu mengatasi dehidrasi dan cocok dikonsumsi saat cuaca panas. Kandungan kalori, lemak, kolesterol, serta natrium dalam mentimun juga tergolong cukup rendah, sehingga aman dikonsumsi bagi kesehatan tubuh.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    fruitPrice: 'Rp 18000',
    imageAsset: 'images/cucumber.png',
    imageUrl:
        'https://pngarchive.com/public/uploads/preview/cucumber-slices-1001569282766tzdchpfyxm.png',
    imageUrls: [
      'https://pngarchive.com/public/uploads/preview/cucumber-slices-1001569282766tzdchpfyxm.png',
    ],
  ),
  PasarBuah(
    name: 'Semangka',
    pack: 'Indonesia - x6 pack',
    description:
        'Setiap gigitan yang berair memiliki kadar vitamin A, B6 dan C, banyak likopen, antioksidan, dan asam amino. Ada pula sebagian kecil kandungan potasium. Semangka juga terkenal bebas lemak, rendah sodium, dan rendah lemak. Secangkir jus semangka hanya mengandung 40 kalori.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    fruitPrice: 'Rp 10000',
    imageAsset: 'images/watermelon.png',
    imageUrl: 'https://pngimg.com/uploads/watermelon/watermelon_PNG2646.png',
    imageUrls: [
      'https://pngimg.com/uploads/watermelon/watermelon_PNG2646.png',
    ],
  ),
  PasarBuah(
    name: 'Mangga',
    pack: 'Indonesia - x2 pack',
    description:
        ' Buah mangga adalah salah satu buah tropis paling populer yang banyak tumbuh di Indonesia. Saat musimnya tiba, harganya bisa sangat terjangkau dan memuaskan dahaga penggemarnya.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    fruitPrice: 'Rp 30000',
    imageAsset: 'images/mango.png',
    imageUrl:
        'https://i.dlpng.com/static/png/3886918-mango-png-transparent-images-png-of-mango-1686_1116_preview.webp',
    imageUrls: [
      'https://i.dlpng.com/static/png/3886918-mango-png-transparent-images-png-of-mango-1686_1116_preview.webp',
    ],
  ),
  PasarBuah(
    name: 'Anggur',
    pack: 'Indonesia - x6 pack',
    description:
        'Secara umum, kandungan nutrisi anggur terdiri dari 70 persen air dan 20 persen zat gula. 10 persen kandungan gizi lainnya pada anggur berupa asam galat, glukosida, asam folat, mangan, zat besi, sejumlah vitamin, dan kalsium.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    fruitPrice: 'Rp 25000',
    imageAsset: 'images/grape.png',
    imageUrl:
        'https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png',
    imageUrls: [
      'https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png',
    ],
  ),
  PasarBuah(
    name: 'Olive',
    pack: 'Indonesia - x6 pack',
    description:
        'Manfaat olive oil untuk wajah dipercaya dapat melembapkan dan membuat wajah lebih bersinar. Meski begitu, manfaat olive oil untuk wajah tak bisa sembarang digunakan.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    fruitPrice: 'Rp 50000',
    imageAsset: 'images/olive.png',
    imageUrl: 'https://i.dlpng.com/static/png/6988360_preview.png',
    imageUrls: [
      'https://i.dlpng.com/static/png/6988360_preview.png',
    ],
  ),
];
