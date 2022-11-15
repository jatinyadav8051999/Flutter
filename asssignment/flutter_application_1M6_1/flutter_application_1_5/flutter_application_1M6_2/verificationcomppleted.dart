//...
timeout: Duration(seconds: 60),
verificationCompleted: (AuthCredential authCredential){
//code for signing in
}).catchError((e){
  print(e);
});
},
verificationFailed: null,//...
timeout: Duration(seconds: 60),
verificationCompleted: (AuthCredential authCredential){
_auth.signInWithCredential(_credential).then((AuthResult result){
Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (context) => HomeScreen(result.user)
  ));
}).catchError((e){
  print(e);
});
},
verificationFailed: null,
//...//...
verificationFailed: (AuthException authException){
  print(authException.message);
},
//...//...
codeSent: (String verificationId, [int forceResendingToken]){
  //show dialog to take input from the user
}
//...//...
codeSent: (String verificationId, [int forceResendingToken]){
  //show dialog to take input from the user
  showDialog(
  context: context,
  barrierDismissible: false,
  builder: (context) => AlertDialog(
    title: Text("Enter SMS Code"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          controller: _codeController,
        ),

      ],
    ),
    actions: <Widget>[
      FlatButton(
        child: Text("Done"),
        textColor: Colors.white,
        color: Colors.redAccent,
        onPressed: () {
          FirebaseAuth auth = FirebaseAuth.instance;
          
          smsCode = _codeController.text.trim();
          
          _credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
          auth.signInWithCredential(_credential).then((AuthResult result){
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => HomeScreen(result.user)
            ));
          }).catchError((e){
            print(e);
          });
        },
      )
    ],
  )
);
}
//...
We have used below line to make AuthCredential from verification code and OTP Code that user received.

PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
At Last, just define the codeAutoRetrievalTimeout, it is called when the timeout occurs for Code Auto Retrieval. We are not doing anything just printing the acknowledgement that the time for Auto retrieval is finished.

//...
codeAutoRetrievalTimeout: (String verificationId){
  verificationId = verificationId;
  print(verificationId);
  print("Timout");
};
//...
So we have finished the Future for Registering or Login the user, now we just need to call it inside the onPressed of the FlatButton in the Login Screen at Place B.

//...
Container(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text("Login"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16),
                    onPressed: (){
                        //code for sign in
                        final mobile = _phoneController.text.trim();
                        registerUser(mobile, context);
                    },
                    color: Colors.blue,
                  ),
                )
//...
PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);//...
codeAutoRetrievalTimeout: (String verificationId){
  verificationId = verificationId;
  print(verificationId);
  print("Timout");
};
//...//...
Container(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text("Login"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16),
                    onPressed: (){
                        //code for sign in
                        final mobile = _phoneController.text.trim();
                        registerUser(mobile, context);
                    },
                    color: Colors.blue,
                  ),
                )
//...