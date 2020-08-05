

class StudentValidationMixin{

  String validationFirstName(String value){

    if(value.length<2){
      return "İsim en az 2 harfli olmalıdır";
    }

  }

  String validationLastName(String value){
    if(value.length<2){
      return "Soyisim en az 2 harfli olmalıdır.";
    }

  }

  String validationGrade(String value){
    if(int.parse(value)<0  ||  int.parse(value)>100){
      return "Not 0 ile 100 arasinda olmalidir.";
    }

  }


}