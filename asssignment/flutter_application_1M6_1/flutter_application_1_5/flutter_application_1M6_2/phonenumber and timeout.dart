Future registerUser(String mobile, BuildContext context) async{

  FirebaseAuth _auth = FirebaseAuth.instance;
  
  _auth.verifyPhoneNumber(
    phoneNumber: mobile,
    timeout: Duration(seconds: 60),
    verificationCompleted: null,
    verificationFailed: null,
    codeSent: null,
    codeAutoRetrievalTimeout: null
  );
}