class SignUpBody{
  String? name;
  String? address;
  String? phone;
  String? email;
  String? password;

  SignUpBody({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.password
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["address"] = address;
    data["phone"] = phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}