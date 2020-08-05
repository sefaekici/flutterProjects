import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/main.dart';
import 'package:ogrenci_takip_sistemi/models/student.dart';
import 'package:ogrenci_takip_sistemi/validation/studen_validator.dart';

class StudentUpdate extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return _StudentUpdateState ();
  }

}

class _StudentUpdateState extends State<StudentUpdate> with StudentValidationMixin{
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Öğrenci Güncelle"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin:EdgeInsets.all(25),
        padding: EdgeInsets.all(5),
        child: Form(
          key: formKey,
          child:Column(
            children: <Widget>[
              StudentUpdateFirstName(),
              SizedBox(width: 0,height: 10,),
              StudentUpdateLastName(),
              SizedBox(width: 0,height: 10,),
              StudentUpdateGrade(),
              StudentUpdateSave()

            ],
          ),
        ),
      ),
    );
  }

  Widget StudentUpdateFirstName(){
    return TextFormField(
      initialValue: seciliOgrenci.firstName,
      decoration: InputDecoration(labelText:("Ogrenci Adı"),hintText: "Sefa"),
      validator:validationFirstName,
      onSaved: (String value){
        seciliOgrenci.firstName=value;
      },
    );
  }

  Widget StudentUpdateLastName(){
    return TextFormField(
      initialValue: seciliOgrenci.lastName,
      decoration: InputDecoration(labelText:("Öğrenci Soyadi"),hintText: "Ekici"),
      validator:validationFirstName,
      onSaved: (String value){
        seciliOgrenci.lastName=value;
      },
    );
  }


  Widget StudentUpdateGrade(){
    return TextFormField(
      initialValue: seciliOgrenci.grade.toString(),
      decoration: InputDecoration(labelText:("Öğrencinin Notu"),hintText: "65"),
      validator:validationFirstName,
      onSaved: (String value){
        seciliOgrenci.grade=int.parse(value);
      },
    );
  }

  Widget StudentUpdateSave (){
      return RaisedButton(
        child: Text("Güncelle"),
        color: Colors.blueAccent,

        onPressed: (){
          this.setState(() {
            if(formKey.currentState.validate()){
              formKey.currentState.save();
              Navigator.pop(context);
            }
          });
        },
      );
  }
}

