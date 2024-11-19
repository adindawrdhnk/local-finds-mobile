# LOCAL FINDS

**E-Commerce Mobile Application**

---

## TUGAS 7

### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

**Stateless Widget** adalah widget yang tidak memiliki state atau status yang dapat berubah. Artinya, setelah widget ini dibuat, tampilan dan sifatnya tetap konstan selama siklus hidupnya. Stateless widget hanya dibangun sekali dan tidak akan diperbarui kecuali jika parent widget-nya diubah.

**Stateful Widget** adalah widget yang dapat memiliki state yang dapat berubah. Widget ini memungkinkan perubahan pada tampilan UI berdasarkan perubahan state. Ini berguna ketika widget perlu merespons interaksi pengguna atau perubahan data.

**Perbedaan utama** antara keduanya adalah bahwa **Stateful Widget** dapat mengelola dan memperbarui state, sedangkan **Stateless Widget** tidak memiliki kemampuan tersebut, menjadikannya lebih ringan dan efisien.

### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

Pada proyek **Local Finds**, saya menggunakan berbagai widget Flutter untuk membangun antarmuka pengguna:

- **MaterialApp**: Widget utama yang menyediakan fondasi untuk aplikasi berbasis Material Design, termasuk pengaturan tema dan navigasi global.
- **Scaffold**: Struktur dasar halaman yang menyediakan elemen-elemen UI seperti **AppBar**, **Drawer**, dan **body**.
- **Text**: Digunakan untuk menampilkan teks di UI, seperti pada **AppBar** dan tombol.
- **Column** dan **Row**: Digunakan untuk menyusun elemen-elemen secara vertikal dan horizontal.
- **Padding**: Memberikan ruang tambahan di sekitar elemen untuk meningkatkan tampilan UI.
- **GridView**: Digunakan untuk menampilkan tombol-tombol dalam format grid.
- **ItemCard**: Menyusun tampilan tombol di grid dengan **Icon** dan **Text**.
- **InkWell**: Memberikan efek responsif saat tombol ditekan.
- **ScaffoldMessenger**: Menampilkan pesan **SnackBar** sebagai umpan balik ketika tombol ditekan.

### 3. Apa fungsi dari 'setState()'? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Fungsi `setState()` dalam **Stateful Widget** digunakan untuk memberi tahu framework bahwa ada perubahan pada **state** widget. Ketika `setState()` dipanggil, Flutter akan memicu proses **rebuild** widget tersebut, memungkinkan UI untuk diperbarui dan menampilkan informasi terbaru. Variabel yang terdampak oleh `setState()` biasanya adalah variabel yang dideklarasikan dalam kelas **State** (misalnya dalam `_MyHomePageState`), yang digunakan untuk menyimpan data yang mempengaruhi tampilan UI, seperti status, nilai input pengguna, atau data yang diperbarui.

### 4. Jelaskan perbedaan antara const dengan final.

Dalam Dart, `const` dan `final` adalah dua cara untuk mendeklarasikan variabel yang tidak dapat diubah setelah inisialisasi, tetapi dengan perbedaan utama:

- **`const`**: Variabel yang dideklarasikan dengan `const` memiliki nilai yang sudah ditentukan pada waktu kompilasi, dan objek yang didefinisikan dengan `const` bersifat **immutable** dan **singleton**. Ini memungkinkan optimasi karena instance yang sama akan digunakan di seluruh aplikasi.
  
- **`final`**: Variabel yang dideklarasikan dengan `final` hanya dapat diinisialisasi sekali dan bersifat **immutable** setelah penetapan, tetapi nilai ini dapat ditentukan pada waktu runtime, tidak harus pada waktu kompilasi.

**Perbedaan utama**: `const` diinisialisasi pada waktu kompilasi, sementara `final` bisa diinisialisasi pada waktu runtime.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

Untuk mengimplementasikan fitur yang diminta, saya mulai dengan membuat proyek Flutter baru bernama **local_finds** dan melakukan inisialisasi Git. Struktur proyek kemudian saya rapikan dengan memindahkan kode dari `main.dart` ke dalam file `menu.dart`. Selanjutnya, saya mengatur tema aplikasi menggunakan `MaterialApp` dan menyesuaikan warna dengan menggunakan `ColorScheme`.

Saya mengubah **`MyHomePage`** dari Stateful menjadi Stateless untuk menyederhanakan kode, serta membuat kelas **`ItemHomepage`** untuk mendefinisikan atribut tombol pada halaman. Daftar item kemudian dibuat dan ditampilkan dalam format **grid** menggunakan **GridView**.

Saya juga membuat **ItemCard** yang berisi tombol-tombol dengan ikon, dan menambahkan **SnackBar** sebagai umpan balik saat tombol ditekan. Setelah menyusun tampilan aplikasi, saya menjalankan **flutter analyze** untuk memastikan tidak ada masalah dalam proyek.

---

## Tugas 8

### 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

**`const`** di Flutter digunakan untuk mendeklarasikan widget atau objek yang tidak berubah dan dapat dibangun pada waktu kompilasi, yang memungkinkan Flutter untuk melakukan optimasi dengan memanfaatkan instance yang sudah ada. Keuntungan utama dari penggunaan `const` adalah **mengurangi penggunaan memori** karena objek yang sama dapat digunakan berulang kali tanpa perlu membuat instance baru.

**Kapan sebaiknya menggunakan `const`:**
- Ketika Anda mendefinisikan widget yang nilainya tetap dan tidak berubah selama siklus hidup aplikasi (misalnya, widget teks, ikon, dan warna yang tidak berubah).
- Untuk meningkatkan kinerja dan efisiensi memori.

**Kapan tidak digunakan:**
- Jika nilai atau widget tersebut bergantung pada data yang berubah selama runtime, maka `const` tidak dapat digunakan.

### 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

- **Column**: Digunakan untuk menyusun elemen secara vertikal (dari atas ke bawah).
  
  **Contoh Column**:
  ```dart
  Column(
    children: [
      Text('Item 1'),
      Text('Item 2'),
      Text('Item 3'),
    ],
  )
  ```

- **Row**: Digunakan untuk menyusun elemen secara horizontal (dari kiri ke kanan).
  
  **Contoh Row**:
  ```dart
  Row(
    children: [
      Text('Item 1'),
      Text('Item 2'),
      Text('Item 3'),
    ],
  )
  ```

**Perbandingan**:
- **Column** mengatur elemen dalam arah vertikal, sementara **Row** mengatur elemen dalam arah horizontal. Keduanya berguna untuk menyusun widget berdasarkan kebutuhan tata letak.

### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Pada halaman formulir yang saya buat, saya menggunakan beberapa elemen input seperti:
- **TextFormField** untuk menerima input teks seperti nama produk, deskripsi produk, dan informasi lainnya.
- **Validator** untuk memastikan input yang dimasukkan valid, seperti memastikan nilai angka tidak negatif dan panjang teks tidak melebihi batas yang ditentukan.

Elemen input Flutter lainnya yang dapat digunakan, tetapi tidak digunakan dalam tugas ini, antara lain:
- **Checkbox**: Untuk memilih pilihan ya/tidak.
- **Radio**: Untuk memilih satu opsi dari beberapa pilihan.
- **Switch**: Untuk memilih antara dua nilai biner.

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Saya mengatur tema aplikasi dengan menggunakan widget **MaterialApp** dan **ThemeData**, yang memungkinkan saya menyesuaikan palet warna utama dan sekunder dengan **ColorScheme**. Tema ini diterapkan ke seluruh aplikasi, menjaga konsistensi tampilan dan nuansa UI. Di dalam aplikasi, saya menggunakan **useMaterial3** untuk mengaktifkan desain material terbaru, yang memperbarui komponen UI seperti tombol, teks, dan ikon.

### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Navigasi dilakukan dengan menggunakan **Navigator.push()** untuk memindahkan pengguna dari satu halaman ke halaman lain. Misalnya, ketika pengguna menekan tombol di halaman utama, aplikasi akan mengarahkan pengguna ke halaman formulir untuk menambah produk baru. Navigasi ini diimplementasikan dengan menggunakan **MaterialPageRoute**, yang memungkinkan untuk mendorong halaman baru ke dalam tumpukan navigasi aplikasi. Untuk drawer, saya menggunakan **Navigator.push** untuk mengarahkan pengguna ke halaman lain, seperti halaman utama atau halaman tambah item.

--- 

## TUGAS 9

### 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

**Model** diperlukan untuk mengatur struktur data yang akan dikirim dan diterima dalam format JSON. Dengan menggunakan model, kita dapat memastikan bahwa data yang dikirim dan diterima sesuai dengan format yang diinginkan dan dapat diakses dengan mudah di dalam aplikasi. Model juga membantu dalam memvalidasi data yang diterima, misalnya memastikan tipe data yang benar, menghindari kesalahan parsing, dan membuat kode lebih terstruktur.

Jika kita tidak membuat model terlebih dahulu, kita mungkin akan mengalami **error parsing JSON** atau data yang tidak terstruktur dengan baik, karena aplikasi tidak tahu bagaimana mengubah data JSON ke dalam format yang bisa digunakan. Ini dapat menyebabkan kesalahan seperti **`TypeError`** atau **`NullPointerException`** saat mencoba mengakses properti data yang tidak sesuai dengan format yang diharapkan.

### 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini.

Library **http** digunakan untuk melakukan komunikasi antara aplikasi Flutter dan server backend, baik untuk mengambil (GET) maupun mengirim (POST) data. Pada tugas ini, saya mengimplementasikan **http** untuk melakukan pengambilan data dari server dan mengirim data pengguna seperti login, register, dan lainnya.

Fungsi utama dari **http** adalah untuk membuat request HTTP ke API, menerima response dalam bentuk JSON, dan kemudian mengolahnya agar dapat digunakan di aplikasi. Dengan menggunakan **http**, kita dapat mengatur header, body, dan metode HTTP yang diperlukan (misalnya GET, POST, PUT, DELETE) untuk berinteraksi dengan server.

### 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

**CookieRequest** adalah sebuah custom request yang digunakan untuk menangani pengiriman dan penerimaan cookies dalam aplikasi. Dalam aplikasi yang membutuhkan autentikasi berbasis sesi (misalnya menggunakan session cookies), kita perlu memastikan bahwa cookie yang diterima dari server disimpan dan dikirim kembali pada setiap request yang dibuat ke server. 

Instance **CookieRequest** perlu dibagikan ke semua komponen di aplikasi untuk memastikan bahwa **cookie autentikasi** (seperti token session) dapat digunakan di seluruh aplikasi, terutama saat pengguna berpindah antar halaman. Ini juga memastikan bahwa aplikasi dapat mempertahankan status login pengguna tanpa perlu meminta login ulang setiap kali.

### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Mekanisme pengiriman data dimulai ketika pengguna memasukkan data pada form input (misalnya nama produk, deskripsi, atau informasi lainnya). Setelah pengguna menekan tombol kirim, aplikasi akan mengambil data dari input tersebut dan mengirimnya menggunakan request HTTP ke backend server. 

Di server, data tersebut diproses, disimpan dalam database, dan kemudian server mengirimkan response berupa data yang sudah diproses atau pesan konfirmasi. Response ini kemudian diparsing di aplikasi Flutter dan digunakan untuk memperbarui tampilan UI. Data yang diterima bisa digunakan untuk memperbarui daftar produk atau menampilkan pesan keberhasilan kepada pengguna.

### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Proses autentikasi dimulai dengan pengguna memasukkan data login (misalnya email dan password) pada form di aplikasi Flutter. Ketika tombol login ditekan, aplikasi mengirimkan request POST ke server Django yang berisi data akun pengguna. Server Django memverifikasi data tersebut, apakah akun dan password yang dimasukkan sesuai dengan yang ada di database. Jika berhasil, server akan mengirimkan **token autentikasi** yang digunakan untuk mengidentifikasi sesi pengguna.

Token ini kemudian disimpan dalam **cookie** atau **storage lokal** pada aplikasi Flutter, dan akan disertakan dalam setiap request berikutnya untuk memastikan bahwa pengguna tetap terautentikasi. Setelah login berhasil, aplikasi Flutter akan menampilkan menu atau halaman utama, sesuai dengan akses pengguna.

Untuk **register**, prosesnya serupa, tetapi menggunakan endpoint yang berbeda di server Django untuk membuat akun baru. Setelah pengguna berhasil terdaftar, mereka bisa langsung login.

Pada saat **logout**, aplikasi akan menghapus token atau cookie yang ada dan mengarahkan pengguna ke halaman login lagi.

### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Untuk mengimplementasikan checklist ini, pertama-tama saya memastikan bahwa proyek Django yang saya kerjakan telah ter-deploy dengan baik dan dapat diakses di local host. Setelah itu, saya mulai dengan mengimplementasikan fitur registrasi akun pada aplikasi Flutter dengan membuat halaman registrasi (`register.dart`). Halaman ini menyediakan form untuk input username, password, dan konfirmasi password, yang kemudian dikirimkan ke server Django untuk diproses.

Setelah fitur registrasi, saya membuat halaman login (`login.dart`) pada aplikasi Flutter yang mengizinkan pengguna untuk masuk menggunakan akun yang telah terdaftar. Sistem autentikasi Django kemudian diintegrasikan dengan aplikasi Flutter menggunakan package `pbp_django_auth` dan `provider`, memungkinkan proses login, logout, dan sesi pengguna yang terhubung dengan Django.

Selanjutnya, saya membuat model kustom di Flutter (`product.dart`) untuk mem-parsing data JSON yang diterima dari Django, sesuai dengan struktur model yang ada di aplikasi Django. Dengan model ini, data item makanan dari server Django dapat ditampilkan dalam aplikasi Flutter.

Kemudian, saya membuat halaman daftar item makanan (`list_product_entry.dart`) yang menampilkan semua item yang ada pada server, mengambil data dari endpoint Django yang telah dideploy. Setiap item menampilkan nama, harga, dan deskripsi, yang diambil dari model item yang telah dibuat sebelumnya.

Saya juga membuat halaman detail item, yang menampilkan seluruh atribut dari item yang dipilih dari daftar. Pengguna dapat mengakses halaman detail dengan menekan salah satu item dari daftar. Untuk memudahkan navigasi, saya menambahkan tombol untuk kembali ke halaman daftar item.

Terakhir, saya melakukan filter pada halaman daftar item sehingga hanya menampilkan item yang terasosiasi dengan pengguna yang sedang login, memastikan bahwa setiap pengguna hanya melihat data yang relevan dengan akun mereka. Dengan demikian, semua fitur ini berhasil diimplementasikan secara terintegrasi antara aplikasi Flutter dan server Django.
