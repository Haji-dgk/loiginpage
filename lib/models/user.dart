class User {
  String email, firstName,secondName,ForgetPassword,password,uid;

//<editor-fold desc="Data Methods">


  User({
    required this.email,
    required this.firstName,
    required this.secondName,
    required this.ForgetPassword,
    required this.password,
    required this.uid,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is User &&
              runtimeType == other.runtimeType &&
              email == other.email &&
              firstName == other.firstName &&
              secondName == other.secondName &&
              ForgetPassword == other.ForgetPassword &&
              password == other.password &&
              uid == other.uid
          );


  @override
  int get hashCode =>
      email.hashCode ^
      firstName.hashCode ^
      secondName.hashCode ^
      ForgetPassword.hashCode ^
      password.hashCode ^
      uid.hashCode;


  @override
  String toString() {
    return 'User{' +
        ' email: $email,' +
        ' firstName: $firstName,' +
        ' secondName: $secondName,' +
        ' ForgetPassword: $ForgetPassword,' +
        ' password: $password,' +
        ' uid: $uid,' +
        '}';
  }


  User copyWith({
    String? email,
    String? firstName,
    String? secondName,
    String? ForgetPassword,
    String? password,
    String? uid,
  }) {
    return User(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      ForgetPassword: ForgetPassword ?? this.ForgetPassword,
      password: password ?? this.password,
      uid: uid ?? this.uid,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'firstName': this.firstName,
      'secondName': this.secondName,
      'ForgetPassword': this.ForgetPassword,
      'password': this.password,
      'uid': this.uid,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      secondName: map['secondName'] as String,
      ForgetPassword: map['ForgetPassword'] as String,
      password: map['password'] as String,
      uid: map['uid'] as String,
    );
  }


//</editor-fold>
}