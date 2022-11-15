import 'dart:developer';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firbase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:phone_auth_handler_demo/screens/home_screen.dart';
import 'package:phone_auth_handler_demo/utils/helpers.dart';
import 'package:phone_auth_handler_demo/widgets/custom_handler';
import 'package:phone_auth_handler_demo/widgets/pin_input_field.dart';

void main() {
  runApp(const MyApp());
}

class verifyphoneNUumberScreen extends StatefulWidget {
  static const id = 'verifyphoneNumberScreen';

  final string phoneNumber;
  Const verifyphoneNumberScreen({
    Key?key,required this.phoneNumber,}) :super(key: key);

    @override
    state<verifyphoneNUumberScreen createstate() =>
       -verifyphoneNUumberScreenstate();
}

class _verifyphoneNUumberScreenstate extends State
   <verifyphoneNUumberScreen>
   with WidgetsBindingObserver{
    bool is keyboard visible=false;

    late final ScrollController scrollController;

    @override
    void initstate(){
      scrollController=scrollController();
      WidgetsBinding.instance.addObserver(thjis);
      super.initState();
    }

    @Override
    void dispose() {
      WidgetsBinding.instance.removeObserver(this);
      scrollController.dispose();
      super.dispose();
    }

    @override
    void didchangeMetrics() {
      final bottomviewInsets=WidgetsBinding.instance.window.viewInsets.bottom;
      iskeyboardvisible=bottomviewInsets;

      //scroll to bottom of screen, whe pin input field is in focus.
      Future<void> _scrollToBottomonkeyboardopen() async {
        while(!iskeyboardvisible) {
          await Future.delayed(const Duration(
            milliseconds: 50));
        }      
        
        await Future.delayed(const Duration(
          milliseconds: 250));

          await scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const.Duration(miliseconds:250),
            curve: Curves.easeIn,
          );

          
          @override
          Widget build(BuildContext context) {
            return SafeArea(
              child: FirebasephoneAuthHandler,
              phoneNumber:Widget.phoneNumber,
              signoutonsuccessfulverification:false,
              linkwithExistingUser:false,
              autoretriveTimeoutDuraion:const Duration(seconds: 60),
              otpExpirationDuration:const Duration(seconds: 60),
              oncodesent:() {
                log(verifyphoneNUumberScreen.id,msg:'OTP sent!');
              },
              onLoginsuceess:(usercredential,auto verified) async{
                log(
                  verifyphoneNUumberScreen.id,
                  msg:autoverified
                       ?'OTP was fetched automatically!'
                       :'OTP was verified manually!',
                );

                showsnackBar('phone number verified successfully!');

                log(
                  verifyphoneNUumberScreen.id,
                  msg:'Login success(Id:$usercredential.user?.uid}',
                );

                Navigator.pushNamedAndRemoveUntil(
                  context;
                  HomeScreen.id,
                  (route)=>false,
                );
              },
              onLoginFailed:(authException,stackTrace){
                log(
                  verifyphoneNUumberScreen.id,
                  msg:authException.message,
                  error: authException,
                  stackTrace: stackTrace;
                );

                switch(authException.code) {
                  case'invalid-phone-number':
                   //invalid phone number
                   return showsnackBar('Invalid phone number!');
                   case'invalid-verification-code':
                   //invalid otp entered
                   return showsnackBar('The enter OTP is invalid!');
                   //handle other error codes 
                   default:
                   showssnackBar('something went wrong!');
                   //handle error further if needed

                }
              },
              onError:(error,stackTrace) {
                log(
                  verifyphoneNUumberScreen.id,
                  error: error,
                  stackTrace: stackTrace, 
                );

                showsnackBar('An error occurred!');
              },
              builder:(context,controller) {
                return Scaffold(
                  appBar: AppBar(
                    leadingWidth:0,
                    leading: const SizedBox.shrink(),
                    title: const Text('verifyn phone Number'),
                    actions: [
                      if(controller.codesent)
                        TextButton(onPressed:controller.isOtpExpired
                        ?() async{
                          log(verifyphoneNUumberScreen.id,
                          msg:'Resend OTP');
                          await(controller.sendOTP();
                        }
                        :null,
                        child: Text(
                          controller is OTPEXpired
                          ?'Resend'
                          :'${controller:OtpExpirationTimeLeft.inseconds}';
                          style: (const Textstyle(color:colors.blue,
                            fontsize:18),
                        ),
                        ), 
                        const SizedBox(width: 5),
                    ],
                  ),
                ),
                ),
              body:controller.issendingcode
               ?Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                  customLoader(),
                  SizedBox(height: 50),
                  Center(
                    child: Text(
                      'sending OTP',
                      style: TextStyle(
                        fontSize: 25),
                      ),
                    ),
                ],
                  )
                  :ListView(
                    padding: const EdgeInsets.all(20),
                    controller: scrollController,
                    children: [
                      Text(
                        "we've sent an SMS with a verification code to ${widget.phoneNumber},"
                        style: cost Textstyle(fontsize:25),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      if(controller.isListeningForOtpAutoRetrive)
                      Column(
                        children: const[
                          customLoader(),
                          SizedBox(height: 50),
                          Text(
                            'Listening for OTP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 15),
                          Divider(),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Enter OTP',
                        style: TextStyle(
                        fontsize:20,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                      const SizedBox(height: 15),
                      pinInputfield(
                        length:6,
                        onfocuschanged:(hasfocus) async {
                          if(hasfocus) await-ScrollbarOrientation.bottom
                            onkeyBoardopen();
                        }
                        onsubmit:(enteredotp) async{
                          final verified:
                               await.controller.verifyotp
                               (enteredotp);
                          if(verified) {
                            //number verify success
                            //will call onLogin success handler
                          } else{
                            //phone verification failed
                            //will call onLogin failed onError call bacls with the error
                          } 
                          }, 
                      ),
                    ],
                  ),
          };
         ),
      },
    }     
                    
                
                
               
          
            )
          }
           
        
      }
      
    }