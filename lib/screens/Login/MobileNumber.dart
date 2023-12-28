// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import '../../widgets/widgets.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../Home/HomePage.dart';

// class MobileNumber extends StatefulWidget {
//   const MobileNumber({Key? key}) : super(key: key);

//   @override
//   State<MobileNumber> createState() => _MobileNumberState();
// }

// class _MobileNumberState extends State<MobileNumber> {
//   bool phoneNumberSuccess = true;
//   TextEditingController phone = TextEditingController();
//   TextEditingController sms = TextEditingController();
//   String smsCode = '';

//   FirebaseAuth auth = FirebaseAuth.instance;

//   Future<void> verifyNumber() async {

//     await auth.verifyPhoneNumber(

//   phoneNumber: phone.text,

//   verificationCompleted: (PhoneAuthCredential credential) {
//     print("Success");
//     // setState(() {
//     //   sms.text = credential.smsCode.toString();
//     // });

//     //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

//   },
//   verificationFailed: (FirebaseAuthException e) {
//     if(e.code == 'invalid-phone-number') {
//       print('The Provided phone number is not valid');
//     }
//   },
//   codeSent: (String verificationId, int? resendToken) async {
//     print("Phone number is ${phone.text}");
//     //PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: sms.text);
//    // await auth.signInWithCredential(credential);
//    showDialog(
//   context: context,
//   barrierDismissible: false,
//   builder: (context) => AlertDialog(
//     title: Text("Enter SMS Code"),
//     content: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         TextField(
//           controller: sms,
//         ),

//       ],
//     ),
//     actions: <Widget>[
//       FlatButton(
//         child: Text("Done"),
//         textColor: Colors.white,
//         color: Colors.redAccent,
//         onPressed: () {
//           FirebaseAuth auth = FirebaseAuth.instance;

//           smsCode = sms.text.trim();

//           AuthCredential _credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
//           auth.signInWithCredential(_credential).then(( result){
//             Navigator.pushReplacement(context, MaterialPageRoute(
//               builder: (context) => HomePage()
//             ));
//           }).catchError((e){
//             print(e);
//           });
//         },
//       )
//     ],
//   )
// );
//   },
//   codeAutoRetrievalTimeout: (String verificationId) {},
// );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.black,
//         leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: () => setState(() => phoneNumberSuccess = !phoneNumberSuccess,)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 30.0, left: 20.0),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           phoneNumberSuccess
//               ? text(
//                   name: "Enter your mobile number",
//                   fontweight: FontWeight.bold,
//                   fontSize: 30)
//               : text(
//                   name: "Enter your 4-digit code",
//                   fontweight: FontWeight.bold,
//                   fontSize: 30),
//           const SizedBox(height: 30),
//           Text(phoneNumberSuccess ? "Mobile Number" : "Code"),

//           Padding(
//               padding: const EdgeInsets.only(right: 20.0),
//               child: TextField(
//                 keyboardType: TextInputType.phone,
//                 controller: phoneNumberSuccess ? phone : sms,
//                 //  onChanged: phoneNumberSuccess ? (val) {
//                 //    phone = val as TextEditingController;
//                 //  } : (obj){
//                 //    sms = obj as TextEditingController;
//                 //  },
//                 decoration:
//                     InputDecoration(hintText: phoneNumberSuccess ? '' : '----'),
//               )),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 30.0),
//             child: Text(
//               phoneNumberSuccess ? "" : "Resend Code",
//               style: const TextStyle(color: Colors.green),
//             ),
//           ),
//           phoneNumberSuccess ? Text('',
//             //  authStatus == "" ? "" : authStatus,
//               // style: TextStyle(
//               //     color: authStatus.contains("fail") ||
//               //             authStatus.contains("TIMEOUT")
//               //         ? Colors.red
//               //         : Colors.green),
//             ) : Text('')
//         ]),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             if(phone.text.isEmpty){
//               showmsg('Phone Number field cannot be empty ');
//             } else if(phone.value.text.length < 10){
//               showmsg('Enter a valid Phone Number');
//             }
//             else if (phoneNumberSuccess == true) {
//               //phoneNumberSuccess = false;
//               showmsg("Otp Send Successfully");
//               print("After entering phone number ${phone.text}");
//               verifyNumber();
//             }
//           });
//         },
//         backgroundColor: Colors.green,
//         child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
//       ),
//     );
//   }

//   showmsg(msg){
//      Fluttertoast.showToast(
//         msg: msg,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         //timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_user_login/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Home/HomePage.dart';

class LoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  Future<void> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),

      verificationCompleted: (PhoneAuthCredential credential) async {
        Navigator.of(context).pop();

        var result = await _auth.signInWithCredential(credential);

        User? user = result.user;

        if (user != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          print("Error");
        }

        //This callback would gets called when verification is done auto maticlly
      },
      verificationFailed: (FirebaseAuthException exception) {
        print(exception);
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const Text("Give the code?"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text("Confirm"),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all( Colors.blue),foregroundColor: MaterialStateProperty.all( Colors.white)),
                    // textColor: Colors.white,
                    // color: Colors.blue,
                    onPressed: () async {
                      final code = _codeController.text.trim();
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId, smsCode: code);

                      await _auth.signInWithCredential(credential);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  )
                ],
              );
            });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      //codeAutoRetrievalTimeout: 'eeeee',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Login",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      // borderSide: BorderSide(color: Colors.grey[200])
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      //borderSide: BorderSide(color: Colors.grey[300])
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: "Mobile Number"),
                controller: _phoneController,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("LOGIN"),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
                      backgroundColor: MaterialStateProperty.all( Colors.blue),foregroundColor: MaterialStateProperty.all( Colors.white)),
                 // textColor: Colors.white,
                  //padding: EdgeInsets.all(16),
                  onPressed: () {
                    final phone = _phoneController.text.trim();

                    loginUser(phone, context);
                  },
                 // color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
