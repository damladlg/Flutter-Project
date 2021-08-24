import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Educatet'),
                bottom: TabBar(
                  tabs: [
                    Tab(text: "Eğitimlerim"),
                    Tab(text: "Ön Kayıtı Eğitimlerim")
                  ],
                ),
              ),
              body: TabBarView(
                children: [ListViewBuilder(), ListViewBuilder()],
              ),
            )));
  }
}

class ListViewBuilder extends StatelessWidget {
  final titles = ["Eğitim 1", "Eğitim 2", "Eğitim 3"];
  final subtitles = [
    "Çevrimiçi Eğitim 1",
    "Çevrimiçi Eğitim 2",
    "Çevrimiçi Eğitim 3"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        double percentages = 2;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.network(
              'https://picsum.photos/250?image=9',
              fit: BoxFit.cover,
              width: 100.0,
              height: 500.0,
            ),
            title: Text(titles[index]),
            subtitle: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                    child: new Text(subtitles[index],
                        style: new TextStyle(
                          fontSize: 13.0,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4.0),
                    child: new Text("Başlangıç Tarihi:",
                        style: new TextStyle(fontSize: 11.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                    child: new Text("Bitiş Tarihi:",
                        style: new TextStyle(fontSize: 11.0)),
                  ),
                  new LinearProgressIndicator(value: percentages),
                ]),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
