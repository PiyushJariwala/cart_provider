import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart_provider/providers/phone_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("MyPhone"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount:
                          Provider.of<PhoneProvider>(context).cart.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          child: ListTile(
                            leading: Container(
                              height: 100,
                              width: 50,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${Provider.of<PhoneProvider>(context).cart[index].image_link}",
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, _) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            title: Text(
                                "${Provider.of<PhoneProvider>(context).cart[index].mobile}"),
                            subtitle: Text(
                                "₹${Provider.of<PhoneProvider>(context).cart[index].price}"),
                            trailing: Container(
                              height: 40,
                              width: 80,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Provider.of<PhoneProvider>(context,
                                                listen: false)
                                            .removeFromCart(index);
                                      },
                                      child: Icon(
                                        Icons.remove_circle_outline,
                                        size: 30,
                                      )),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${Provider.of<PhoneProvider>(context).qontity_List[index]}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Provider.of<PhoneProvider>(context,
                                                listen: false)
                                            .addFromCart(index);
                                      },
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Product : ${Provider.of<PhoneProvider>(context).total_product}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price : ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "₹${Provider.of<PhoneProvider>(context).total_price}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
