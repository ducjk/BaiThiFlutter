import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 34, 50, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(context),
              SizedBox(
                height: 16,
              ),
              buildGridView(context),
            ],
          ),
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: IconButton(
              padding: EdgeInsets.all(0),
              iconSize: 58,
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/logo.svg',
                semanticsLabel: 'Logo',
                width: 58,
                height: 58,
              ),
            ),
          ),
          SizedBox(
            width: 264,
            height: 40,
            child: Row(children: [
              SizedBox(
                width: 114,
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_location,
                    size: 16,
                  ),
                  label: Text(
                    "Hue, VN",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              SizedBox(
                height: 40,
                width: 68,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.language,
                    size: 16,
                  ),
                  label: Text(
                    "Vi",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              SizedBox(
                height: 40,
                width: 70,
                child: TextButton(
                  onPressed: () {},
                  child: SizedBox(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 221, 120, 57)),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  buildGridView(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          ...listProduct.map((e) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => (ProductDetail(
                          product: e,
                          numberCar: numberCar,
                        ))),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Image.network(
                        e.image ?? "",
                        fit: BoxFit.cover,
                        height: 108,
                        width: 108,
                      ),
                      Text(
                        e.title ?? "Title is null",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${e.price.toString()}' ?? '00.00',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            e.category ?? '',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextButton(
                        onPressed: () {
                          productProvider.getListCart(e);
                          cartfile.writeCounter(productProvider.listCart);
                          setState(() {
                            numberCar = productProvider.listCart.length;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        child: Text(
                          "Add to cart",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
