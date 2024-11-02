# LOCAL FINDS

E-Commerce Mobile Application 

# TUGAS 7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
### Stateless Widget
**Stateless Widget** adalah widget yang tidak memiliki state atau status yang dapat berubah. Ini berarti bahwa once widget ini dibuat, tampilan dan sifatnya tetap konstan selama siklus hidupnya. Stateless widget hanya dibangun sekali dan tidak akan diperbarui kecuali jika parent widget-nya diubah.
### Stateful Widget
**Stateful Widget** adalah widget yang dapat memiliki state yang dapat berubah. Stateful widget dapat memperbarui tampilannya sendiri berdasarkan perubahan state. Ini berguna ketika widget perlu merespons interaksi pengguna atau perubahan data.
#### Perbedaan utama di antara keduanya terletak pada kemampuan Stateful Widget untuk mengelola dan memperbarui state, menjadikannya sedikit lebih berat dalam hal performa dibandingkan dengan Stateless Widget yang lebih ringan dan efisien.

## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Dalam proyek ini, saya memanfaatkan berbagai widget Flutter untuk membangun antarmuka pengguna. Pertama, saya menggunakan **MaterialApp** sebagai widget utama yang menyediakan fondasi untuk aplikasi berbasis Material Design, termasuk pengaturan tema dan navigasi global. Di dalamnya, **Scaffold** berfungsi sebagai struktur dasar untuk halaman, menawarkan elemen-elemen UI seperti **AppBar** dan **body**. Di bagian AppBar, saya menambahkan judul aplikasi menggunakan widget **Text**. Untuk mengatur tata letak di body, saya memanfaatkan **Column** dan **Row**, yang memungkinkan penyusunan elemen secara vertikal dan horizontal, serta menggunakan **Padding** untuk memberikan ruang tambahan di sekitar elemen. Selanjutnya, saya mengimplementasikan **GridView** dalam mode count untuk menampilkan tombol-tombol dalam format grid. Setiap tombol diwakili oleh **ItemCard**, yang terdiri dari widget **InkWell** untuk memberikan efek responsif saat diklik, serta **Icon** dan **Text** yang menampilkan ikon dan nama item. **InkWell** berfungsi untuk memberikan efek animasi pada saat tombol ditekan, meningkatkan pengalaman pengguna dengan memberikan umpan balik visual. Selain itu, saya menggunakan **ScaffoldMessenger** untuk menampilkan pesan **SnackBar** sebagai respons ketika tombol ditekan, sehingga memberikan informasi tambahan kepada pengguna tentang interaksi yang mereka lakukan. Pendekatan ini menciptakan antarmuka pengguna yang responsif dan intuitif, meningkatkan interaksi pengguna dengan aplikasi.


##  Apa fungsi dari 'setState()' ? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
### Fungsi 'setState()' dalam Flutter adalah metode yang digunakan dalam Stateful Widget untuk memberi tahu framework bahwa ada perubahan yang terjadi pada state widget. Ketika setState() dipanggil, Flutter akan memicu proses rebuild pada widget yang bersangkutan, memungkinkan UI untuk diperbarui dan menampilkan informasi terbaru. Ini sangat penting untuk memastikan bahwa antarmuka pengguna mencerminkan status terkini dari data atau variabel yang digunakan dalam widget. Variabel yang terdampak oleh setState() biasanya adalah variabel yang dideklarasikan dalam kelas state (misalnya, dalam _MyStatefulWidgetState). 

## Jelaskan perbedaan antara const dengan final.
Dalam Dart, `const` dan `final` adalah dua cara untuk mendeklarasikan variabel yang tidak dapat diubah setelah inisialisasi, tetapi mereka memiliki perbedaan penting. Variabel yang dideklarasikan dengan `const` memiliki nilai yang sudah ditentukan pada waktu kompilasi, artinya nilai tersebut harus diketahui sebelum program dijalankan dan bersifat immutable. Ini memungkinkan Dart melakukan optimasi tertentu, karena objek dengan nilai yang sama akan berbagi instance yang sama. Di sisi lain, `final` memungkinkan inisialisasi dengan nilai yang ditentukan pada waktu runtime, sehingga Anda dapat menetapkan nilai berdasarkan hasil perhitungan atau proses lain yang terjadi saat aplikasi berjalan. Meskipun kedua jenis variabel ini bersifat immutable setelah diinisialisasi, `const` lebih ketat dalam hal penetapan nilai pada waktu kompilasi, sementara `final` memberikan lebih banyak fleksibilitas dalam hal waktu inisialisasi.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
Pada proyek ini, saya memulai dengan membuat proyek Flutter baru bernama `local_finds` dan melakukan inisialisasi Git untuk mengelola versi kode ke repositori baru bernama `local-finds-mobile`. Setelah itu, saya merapikan struktur proyek dengan membuat file `menu.dart` di dalam direktori `lib`, dan memindahkan kode dari `main.dart` yang berisi kelas `MyHomePage` dan `_MyHomePageState` ke dalam file tersebut. Untuk menghindari error, saya menambahkan import yang sesuai di `main.dart`. Selanjutnya, saya mengubah tema aplikasi menjadi lebih menarik dengan mengatur palet warna di dalam `MaterialApp`. Saya menggunakan `ColorScheme` untuk menyesuaikan warna utama dan sekunder, sehingga tampilan aplikasi menjadi lebih sesuai dengan tema yang diinginkan.

Selain itu, saya mengubah `MyHomePage` dari Stateful menjadi Stateless untuk menyederhanakan kode, serta membuat kelas `ItemHomepage` untuk mendefinisikan atribut tombol pada halaman. Saya kemudian membuat daftar item yang akan ditampilkan, termasuk nama dan ikon untuk setiap tombol. Untuk memudahkan tampilan, saya merancang `ItemCard` sebagai widget yang bertugas menampilkan tombol dengan ikon dan menambahkan Snackbar sebagai umpan balik saat tombol ditekan. Terakhir, saya mengintegrasikan `ItemCard` ke dalam `MyHomePage`, menampilkan tombol-tombol tersebut dalam format grid yang responsif. Saya juga memastikan untuk menjalankan perintah `flutter analyze` setelah melakukan semua perubahan, untuk memeriksa apakah ada isu yang terdeteksi dalam proyek, sehingga aplikasi yang saya kembangkan tidak hanya interaktif, tetapi juga berkualitas tinggi dan bebas dari kesalahan. Dengan langkah-langkah ini, saya berhasil membuat antarmuka yang responsif dan interaktif untuk aplikasi, siap untuk fase pengembangan berikutnya.