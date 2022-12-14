import 'package:bai_thi_flutter/login_register/forgotmk.dart';
import 'package:bai_thi_flutter/login_register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class loginPage extends StatelessWidget {
   loginPage({Key? key}) : super(key: key);

  var _formLoginKey = GlobalKey<FormState>();
  var _userNameKey = TextEditingController();
  var _passwordKey = TextEditingController();
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
              SizedBox(
                height: 220,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Đăng nhập",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                key: _formLoginKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600,  color: Colors.white),
                      ),
                      SizedBox(
                      height: 6,
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
                          hintText: "Tên đăng nhập", hintStyle:TextStyle( color:Color.fromRGBO(99, 115, 148 , 1)),
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color:Color.fromARGB(255, 221, 120, 57), width: 2.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        controller: _userNameKey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Mật khẩu",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                       SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Trường này không được để trống";
                          }
                          if (value.length < 6)
                            return "Trường này tối thiếu 6 kí tự";
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: "Mật khẩu", hintStyle:TextStyle( color:Color.fromRGBO(99, 115, 148 , 1)) ,
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                           
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color.fromARGB(255, 221, 120, 57), width: 2.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        controller: _passwordKey,
                      ),
                      SizedBox(
                        height: 20,
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
                                  child: Text("Đăng nhập", style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600,  color: Colors.white))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => registerPage(),
                                ),
                              );
                            },
                            child: Text("Đăng ký", style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600,  color: Colors.white),),
                          ),
                        SizedBox(
                          width: 30,
                        ),
                      GestureDetector(
                      onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  forgotPage(),
                        ),
                      );
                    },
                    child: Text("Quên mật khẩu?", style: TextStyle(
                          color:Color.fromARGB(255, 221, 120, 57),  fontSize: 18, fontWeight: FontWeight.w600,
                        )),
                  ),
                        ],
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}