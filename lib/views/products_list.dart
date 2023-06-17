import 'package:flutter/material.dart';
import 'package:flutter_product_app/widgets/product_list_item.dart';
import '../models/product.dart';
import '../viewmodels/product_vm.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  List<Product> productList = [];
  List<Product> filteredList = [];
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final productViewModel = ProductViewModel();
    try {
      final products = await productViewModel.fetchProducts();
      setState(() {
        productList = products;
        filteredList = products;
        isError = false;
      });
    } catch (error) {
      setState(() {
        productList = [];
        filteredList = [];
        isError = true;
      });
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error encountered'),
            content: const Text('Failed to retrieve products!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _filterProducts(String searchText) {
    setState(() {
      filteredList = productList
          .where((product) =>
          product.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  Future<void> _refreshProducts() async {
    await _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cars Catalog'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: _filterProducts,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                RefreshIndicator(
                  onRefresh: _refreshProducts,
                  child: (productList.isEmpty || isError) && !isLoading
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text(
                          'No products found!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 15,),
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await _refreshProducts();
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: const Text(
                            'TRY AGAIN',
                          ),
                        )
                      ],
                    ),
                  )
                      : ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final product = filteredList[index];
                      return ProductListItem(product: product);
                    },
                  ),
                ),
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}