class AdminModel {

  late String name;
  late String email;
  late String phone;
  late String uId;
  late String Section;

  AdminModel(
      this.name,
      this.email,
      this.phone,
      this.uId,
      this.Section
      );



  AdminModel.fromJson(dynamic json){
    name=json!["name"]!;
    email=json!["email"]!;
    phone=json!["phone"]!;
    uId=json!["uId"]!;
    Section=json!["Section"]!;
  }

  Map<String,dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'Section':Section

    };
  }


}
