import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car Details"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 7,),
              //PRODUCT IMAGE+PRICE
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black54,
                          ),
                          child: Text(
                            '${product.price} TND',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //PRODUCT NAME
              Text(
                product.name,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              //PRODUCT DESCRIPTION
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFD9D9D9),
                    ),
                    child: Text(
                      product.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              //FIRST ROW (YEAR+FUEL TYPE)
              Row(
                children: [
                  //CAR PRODUCTION YEAR
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10,5,5,5),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFD9D9D9),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "YEAR",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${product.yearOfProduction}',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //CAR FUEL TYPE
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5,5,10,5),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFD9D9D9),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "FUEL TYPE",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              product.fuelType,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //SECOND ROW (ENGINE+CONSUMPTION)
              Row(
                children: [
                  //CAR ENGINE
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10,5,5,5),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFD9D9D9),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "ENGINE",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              product.engine,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //CAR CONSUMPTION
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5,5,10,5),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFD9D9D9),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "CONSUMPTION",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              product.fuelConsumption,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              //ADD TO FAVE BTN
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Added to favourites"),
                      ));
                    },
                    icon: const Icon(Icons.favorite),
                    label: const Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                      child: Text('ADD TO FAVOURITE'),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
