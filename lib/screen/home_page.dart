import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart_provider/dummyData/dummydata.dart';
import 'package:cart_provider/providers/phone_provider.dart';
import 'package:cart_provider/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("MyPhone"),
          actions: [
            Switch(
                value: Provider.of<ThemeProvider>(context).isDark,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeTheme();
                },
              activeColor: Colors.amber,
              inactiveTrackColor: Colors.white30,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        "${Provider.of<PhoneProvider>(context).cart.length}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                            fontSize: 15),
                      ),
                    )),
              ],
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
              itemCount: Dummy_product.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  child: ListTile(
                    leading: Container(
                      height: 100,
                      width: 50,
                      child: CachedNetworkImage(
                        imageUrl: "${Dummy_product[index].image_link}",
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, _) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    title: Text("${Dummy_product[index].mobile}"),
                    subtitle: Text("₹${Dummy_product[index].price}"),
                    trailing: IconButton(
                        onPressed: () {
                          if (Dummy_product[index].add_cart == false) {
                            Provider.of<PhoneProvider>(context, listen: false)
                                .addToCart(index);
                            Dummy_product[index].add_cart = true;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "You have already added this product in your cart")),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 30,
                        )),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
