import 'package:flutter/material.dart';





class Student{
  int id;
  String firstName;
  String lastName;
  int grade;
  String status;
  String PictureLink;
  Icon icon;

  Student(int id,String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.status = GetStatus();
    this.icon=IconGetter();
    this.PictureLink="https://cdn2.iconfinder.com/data/icons/people-80/96/Picture1-512.png";
  }

  Student.WithPicture(int id,String firstName, String lastName, int grade,String PictureLink) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.PictureLink=PictureLink;
    this.status = GetStatus();
    this.icon=IconGetter();
  }

  Student.WithOutInfo(){

    this.status=GetStatus();
    this.icon=IconGetter();
    this.PictureLink="https://cdn2.iconfinder.com/data/icons/people-80/96/Picture1-512.png";
  }

  String getfirstName() {
    return firstName;
  }

  String getlastName() {
    return lastName;
  }

  String getPictureLink() {
    return PictureLink;
  }

  String GetStatus() {
    var _status =" ";
    if (getGrade() < 40 && getGrade()>=0 && getGrade()!=null) {
      _status = "Kaldı";
    } else if (getGrade()>= 40 && getGrade() <= 70) {
      _status = "Sartli Gecti";
    } else {
      _status = "Gecti";
    }
    return _status;
  }
  int getGrade(){
    if(this.grade==null){
      this.grade=0;
    }
    return this.grade;
  }

  Widget IconGetter() {
    if (this.status == "Gecti") {
      return Icon(Icons.done);
    } else if (this.status == "Kaldı") {
      return Icon(Icons.cancel);
    } else {
      return Icon(Icons.alarm);
    }
  }
}
