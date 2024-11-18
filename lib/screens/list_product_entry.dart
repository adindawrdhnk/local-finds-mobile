import 'package:flutter/material.dart';
import 'package:local_finds/models/product.dart';
import 'package:local_finds/widgets/left_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object Product
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data produk.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.blue.shade50, // Warna latar belakang Card
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data![index].fields.name}",
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Rp${snapshot.data![index].fields.price}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${snapshot.data![index].fields.description}",
                            maxLines: 2, // Membatasi deskripsi agar tidak terlalu panjang
                            overflow: TextOverflow.ellipsis, // Jika panjang, tampilkan '...'
                            style: const TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          const SizedBox(height: 10),
                          // Tombol untuk menampilkan detail produk
                          ElevatedButton(
                            onPressed: () {
                              // Tampilkan halaman detail produk
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailPage(
                                    product: snapshot.data![index],
                                  ),
                                ),
                              );
                            },
                            child: const Text('Detail Product'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price: Rp${product.fields.price}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Description: ${product.fields.description}"),
            const SizedBox(height: 10),
            Text("Stock: ${product.fields.stock}"),
            const SizedBox(height: 10),
            Text("Origin: ${product.fields.origin}"),
            const SizedBox(height: 10),
            Text("Rating: ${product.fields.rating}/5"),
            const SizedBox(height: 10),
            Text("Discount: ${product.fields.discount}%"),
          ],
        ),
      ),
    );
  }
}
