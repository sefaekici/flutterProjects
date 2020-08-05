import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ogrenci_takip_sistemi/models/student.dart';
import 'package:ogrenci_takip_sistemi/screens/student_add.dart';
import 'package:ogrenci_takip_sistemi/screens/student_update.dart';


//Boş öğrenci amaçlı oluşturuldu.
Student seciliOgrenci =new Student(0," "," ",0);

//Secili Ogrencinin İndexini kullanmak için tanımlanmış değişken
int seciliIndex=null;

//Ogrenci Listesi
List<Student> students = [
  new Student.WithPicture(1,"Aleyna", "Ekici", 30,"https://miro.medium.com/fit/c/160/160/0*w93spCPzkbxnXog2"),
  new Student.WithPicture(2,"Burak", "Ekici", 100,"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQn5WBUHJLzgvv8hNaH7XkunyXtVa9jCCedjA&usqp=CAU"),
  new Student.WithPicture(3,"Aleyna", "Dikal", 90,"https://miro.medium.com/fit/c/160/160/0*w93spCPzkbxnXog2"),
  new Student.WithPicture(4,"Sefa", "Ekici", 70,"https://miro.medium.com/max/3150/1*s_e4Bp2wPgO6nlg5KUIWPQ.png"),
];



//main function
void main() {
  runApp(new MaterialApp(
    
      home: MyApp()));
}





class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp>  {
  @override
  Widget build(BuildContext context) {
    //Students adında Student sınıfından yani Student tipinde bir liste oluştur.:var student=new List<Student>()
    //Student nesnesi olan ismi Ahmet Soyadı Ekici notu 30 olan bir öğrenci listesi.




    return  new Scaffold(

      appBar: AppBarBuild(),
      body: new Column(
        children: <Widget>[
          new Expanded(
            //listTile sayesinde daha düzgün görüntüler elde edebiliyoruz
            //title Liste elemanının ana başlığı
            //subtitle alt başlık daha soluk gözükür.
            //tralling en sağ kısmı
            //leading en baş kısmı
            child: new ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return new ListTile(

                    title: Text(students[index].getfirstName() +
                        " " +
                        students[index].getlastName()),
                    subtitle: Text(students[index].status+" "+"["+students[index].getGrade().toString()+"]"),
                    trailing: students[index].icon,
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(students[index].getPictureLink()),
                    ),
                    onTap: () {
                      this.setState(() {
                        seciliOgrenci = students[index];
                        seciliIndex=index;

                      });
                    });
              },
            ),
          ),
          Text("Secili Ogrenci:" + seciliOgrenci.getfirstName() +" "+seciliOgrenci.getlastName()),


          Row(
            children: <Widget>[

              //flexible yapılar
                Flexible(
                  //ekrana tamamen sığdırmak için
                  fit: FlexFit.tight,
                  //kaç tane flexible yapı varsa bölünecek parçadaki payı
                  flex: 1,
                 child:new RaisedButton(

                    child: Row(
                      children: <Widget>[
                        Icon(Icons.add),
                        SizedBox(width: 2,),
                        Text("Ogrenci Ekle"),
                      ],
                    ),
                   color: Colors.greenAccent,
                   onPressed: (){


                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));




                   },

                  ),
                ),
              new Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child:RaisedButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.update),
                      SizedBox(width: 2,),
                      Text("Guncelle"),
                    ],
                  ),
                  color: Colors.amberAccent,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentUpdate()));
                  },

                ),
              ),
              new Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child:RaisedButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete),
                      SizedBox(width: 2,),
                      Text("Sil"),
                    ],
                  ),
                  color:  Colors.redAccent,
                  onPressed: (){

                    setState(() {
                      students.remove(seciliOgrenci);
                    });








                  },
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
  Widget AppBarBuild() {
    return AppBar(
      title: Row(
        children: <Widget>[
          Text("Öğrenci Takip Sistemi"),
          SizedBox(width: 95,height: 0,),

          FlatButton(
            child: Icon(Icons.refresh),
            color: Colors.green,
            onPressed: (){
              setState(() {

              });

            },
          ),
        ],
      ),
      backgroundColor: Colors.green,
    );
  }
}





// ignore: non_constant_identifier_names




void AyrintiGoster(var students, int index, BuildContext context) {
  var alert = AlertDialog(
    title: Text("Ogrenci Durumu"),
    content: Text(students[index].status),
  );
  showDialog(context: context, builder: (BuildContext context) => alert);
}



