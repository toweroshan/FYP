class User {
  String userId;
  String username;
  String email;
  String password;
  String address;
  String companyName;
  String contactNumber;

  User(
      {this.userId,
        this.username,
        this.email,
        this.password,
        this.address,
        this.companyName,
        this.contactNumber});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    companyName = json['company_name'];
    contactNumber = json['contact_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['address'] = this.address;
    data['company_name'] = this.companyName;
    data['contact_number'] = this.contactNumber;
    return data;
  }
}