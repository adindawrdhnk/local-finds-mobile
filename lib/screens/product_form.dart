import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  int _stock = 0;
  String _origin = "";
  double _rating = 0;
  double _discount = 0;

@override
Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nama Produk",
                      labelText: "Nama Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value ?? '';
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Nama produk tidak boleh kosong!";
                      }
                      if (value.length > 100) {
                        return "Nama produk tidak boleh lebih dari 100 karakter!";
                      }
                      return null;
                    },
                  ),
                ),
                // Harga Produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Harga Produk",
                      labelText: "Harga Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String? value) {
                      setState(() {
                        _price = int.tryParse(value ?? '0') ?? 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Harga produk tidak boleh kosong!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Harga produk harus berupa angka!";
                      }
                      if (int.tryParse(value)! < 0) {
                        return "Harga produk tidak boleh negatif!";
                      }
                      return null;
                    },
                  ),
                ),
                // Deskripsi Produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Deskripsi Produk",
                      labelText: "Deskripsi Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    maxLines: 3,
                    onChanged: (String? value) {
                      setState(() {
                        _description = value ?? '';
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Deskripsi produk tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                // Stok Produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Jumlah Stok",
                      labelText: "Jumlah Stok",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String? value) {
                      setState(() {
                        _stock = int.tryParse(value ?? '0') ?? 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Jumlah stok tidak boleh kosong!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Jumlah stok harus berupa angka!";
                      }
                      if (int.tryParse(value)! < 0) {
                        return "Jumlah stok tidak boleh negatif!";
                      }
                      return null;
                    },
                  ),
                ),
                // Asal Produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Asal Produk",
                      labelText: "Asal Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _origin = value ?? '';
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Asal produk tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                // Rating Produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Rating Produk",
                      labelText: "Rating Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String? value) {
                      setState(() {
                        _rating = double.tryParse(value ?? '0') ?? 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Rating produk tidak boleh kosong!";
                      }
                      double? rating = double.tryParse(value);
                      if (rating == null) {
                        return "Rating produk harus berupa angka!";
                      }
                      if (rating < 0) {
                        return "Rating produk tidak boleh negatif!";
                      }
                      if (rating < 1 || rating > 5) {
                        return "Rating produk harus antara 1 dan 5!";
                      }
                      return null; 
                    },
                  ),
                ),
                // Diskon Produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Diskon Produk",
                      labelText: "Diskon Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String? value) {
                      setState(() {
                        _discount = double.tryParse(value ?? '0') ?? 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Diskon produk tidak boleh kosong!";
                      }
                      double? discount = double.tryParse(value);
                      if (discount == null) {
                        return "Diskon produk harus berupa angka!";
                      }
                      if (discount < 0) {
                        return "Diskon produk tidak boleh negatif!";
                      }
                      if (discount < 0 || discount > 100) {
                        return "Diskon produk harus antara 0 dan 100!";
                      }
                      return null;
                    },
                  ),
                ),
                // Tombol Simpan
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Kirim data ke backend Django
                          final response = await request.postJson(
                            "http://127.0.0.1:8000/create-product/",
                            {
                              'name': _name,
                              'price': _price,
                              'description': _description,
                              'stock': _stock,
                              'origin': _origin,
                              'rating': _rating,
                              'discount': _discount,
                            },
                          );

                          // Tampilkan dialog sesuai respons dari Django
                          if (response['status'] == 'success') {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Produk berhasil tersimpan'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Nama Produk: $_name'),
                                        Text('Harga Produk: Rp$_price'),
                                        Text('Deskripsi Produk: $_description'),
                                        Text('Jumlah Stok: $_stock'),
                                        Text('Asal Produk: $_origin'),
                                        Text('Rating Produk: $_rating/5'),
                                        Text('Diskon Produk: $_discount%'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _formKey.currentState!.reset();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            // Tampilkan pesan kesalahan jika gagal
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Gagal menyimpan produk. Silakan coba lagi."),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
