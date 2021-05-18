class User {
  String id;
  String name;
  String userID;
  String address1;
  String address2;
  int phone;
  String password;
  User([
    this.name,
    this.userID,
    this.address1,
    this.address2,
    this.phone,
    this.password,
  ]);
  convertToMap() {
    Map<String, dynamic> map = {
      'name': this.name,
      'email': this.userID,
      'address1': this.address1,
      'address2': this.address2,
      'phone': this.phone.toString(),
      'password': this.password,
    };
    return map;
  }
}
