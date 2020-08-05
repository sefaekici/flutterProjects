import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/main.dart';
import 'package:ogrenci_takip_sistemi/validation/studen_validator.dart';
import 'package:ogrenci_takip_sistemi/models/student.dart';


var not=" ";
//Form key alarak kayıt butonu için erişim keyi oluşturmak amacıyla oluşturulmuş bir değişkendir.


// ignore: must_be_immutable
class StudentAdd extends StatefulWidget{
  List<Student> students;
  StudentAdd(List<Student> students){
        this.students=students;
  }

  @override
  State<StatefulWidget> createState() {

    return _StudentAddState(students);
  }

}

//with ile birlikte withlenen classın özellikleri de kullanılabilir hale gelir.
class _StudentAddState extends State<StudentAdd> with StudentValidationMixin{
  Student ogrenci= new Student.WithOutInfo();
  List<Student> students;
  _StudentAddState(List<Student> students){
    this.students=students;
  }
  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Yeni Ogrenci Ekle"),
         backgroundColor: Colors.green,
       ),
       //container bize ekranda sağdan soldan boşluklar bırakmamzı sağlar.
       body:Container(
         margin:EdgeInsets.all(25),
         padding: EdgeInsets.all(5),
         child: Form(
           //yukarıda oluşturulan formKey sayesinde kayıt butonumuz için bir key oluşturuldu.
           key: formKey,
           child: Column(
             children: <Widget>[

               firstNameForm(),
               boslukBirak(0,5),
               lastNameForm(),
               boslukBirak(0,5),
               gradeForm(),
               boslukBirak(0,30),
               buildSubmitButton(),


             ],
           ),
         ),
       ),
     );
  }

  Widget boslukBirak(double genislik,double yukseklik){
    return SizedBox(
      width: genislik,
      height: yukseklik,
    );
  }
  Widget firstNameForm(){
    return TextFormField(
      validator:validationFirstName,
      decoration: InputDecoration(
        labelText:"Ögrencinin Adını Giriniz",
        hintText: "Sefa",


      ),
      onSaved: (String value){

          ogrenci.firstName=value;

      },
    );
  }
  Widget lastNameForm(){
    return TextFormField(
      validator: validationLastName,
      decoration: InputDecoration(
        labelText:"Ögrencinin Soyadını Giriniz",
        hintText: "Ekici",

      ),
      onSaved: (String value){

          ogrenci.lastName=value;


      },
    );
  }
  Widget gradeForm(){
    return TextFormField(
      validator: validationGrade,
      decoration: InputDecoration(
        labelText:"Öğrencinin Notunu Giriniz",
        hintText: "40",

      ),
      onSaved: (String value){
        print(value);

          ogrenci.grade=int.parse(value);

      },
    );
  }
  Widget buildSubmitButton(){
    return RaisedButton(
      child: Text("Kayıt Et"),
      color: Colors.blueAccent,
      onPressed:(){
        this.setState(() {
          if(formKey.currentState.validate()){
            students.add(ogrenci);
            formKey.currentState.save();
            Navigator.pop(context);
          }
        });

      },
    );
  }
}