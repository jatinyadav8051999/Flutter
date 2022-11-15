Future registerUser(String mobile, BuildContext context) async{

  FirebaseAuth _auth = FirebaseAuth.instance;
  
  _auth.verifyPhoneNumber(
    phoneNumber: null,
    timeout: null,
    verificationCompleted: null,
    verificationFailed: null,
    codeSent: null,
    codeAutoRetrievalTimeout: null
  );
}