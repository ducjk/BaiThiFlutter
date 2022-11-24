import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class loginpage extends StatelessWidget {
  const loginpage({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
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
                    onTap: () {},
                    child: Icon(Icons.arrow_back),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => registerPage(),
                        ),
                      );
                    },
                    child: Text("Quên mật khẩu?"),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Đăng nhập",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
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
                        "Tài khoản",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
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
                          hintText: "Tên đăng nhập",
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
                                BorderSide(color: Colors.green, width: 2.0),
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
                            fontSize: 18, fontWeight: FontWeight.w600),
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
                          hintText: "Mật khẩu",
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
                                BorderSide(color: Colors.green, width: 2.0),
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
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
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
                                child: Text("Đăng nhập")),
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
                            child: Text("Đăng ký"),
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