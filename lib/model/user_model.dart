class UserModel {
  String? name;
  String? phone;
  String? chilEmail;
  String? parentEmail;
  String? id;
  UserModel({this.chilEmail, this.name, this.parentEmail, this.phone,this.id});
  Map<String, dynamic> toJason() => {
        'name': name,
        'phone': phone,
        'chilEmail': chilEmail,
        'parentEmail': parentEmail,
        'id': id,
      };
}
