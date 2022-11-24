import 'package:flutter/material.dart';

class forgotPage extends StatelessWidget {
  forgotPage({Key? key}) : super(key: key);
  var _formLoginKey = GlobalKey<FormState>();
  var _userNameKey = TextEditingController();
   @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromRGBO(26, 34, 50, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Color.fromARGB(255, 221, 120, 57)),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quên mật khẩu",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _formLoginKey,
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                       SizedBox(
                      height: 10,
                    ),
                     TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Trường này không được để trống";
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: "Nhập Email", hintStyle:TextStyle( color:Color.fromRGBO(99, 115, 148 , 1)),
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color.fromARGB(255, 221, 120, 57)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        controller: _userNameKey,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 360,
                            child: Container(
                              // decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color.fromRGBO(255, 128, 54, 1), Color.fromARGB(255, 215, 167, 139)]),
                              //  borderRadius: BorderRadius.circular(18.0)),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 221, 120, 57)),
                                    
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formLoginKey.currentState!.validate()) {
                                      var snackBar = SnackBar(
                                          content: Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                          Text("Hello ${_userNameKey.text}")
                                        ],
                                      ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  child: Text("Gữi mã", style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600,  color: Colors.white))),
                            ),
                          ),
                        ],
                      ),
                ],)
              
              )
             
            ]
          ),
        ),
        
      ),
    );
  }
}
