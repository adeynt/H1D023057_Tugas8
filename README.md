# Tugas 8 Praktikum Pemrograman Mobile
## Identitas Diri
Nama: Adeyunita Rachmadhani

NIM: H1D023057

Shift Baru: E

Shift KRS: F


# Screenshot Aplikasi
<img src="https://github.com/user-attachments/assets/0ae08f1d-da6b-4f12-a4b3-d10ffaf173df" height="250">

<img src="https://github.com/user-attachments/assets/10f470d8-cb94-4995-931f-7323354211df" height="250">

<img src="https://github.com/user-attachments/assets/c5ead179-1384-4d3e-b3e4-99b41e5aa02f" height="250">

<img src="https://github.com/user-attachments/assets/bd5df453-682c-44a1-ba2f-aa0b1052395c" height="250">


# Penjelasan
### 1. Halaman Produk_Page
ProdukPage adalah halaman utama yang muncul ketika aplikasi dibuka. Pada halaman ini pengguna melihat daftar produk yang ditampilkan dalam bentuk list. Daftar tersebut masih berupa data contoh yang didefinisikan langsung di dalam kode. Setiap produk ditampilkan melalui widget ItemProduk, yang menampilkan nama dan harga secara ringkas. Ketika pengguna memilih salah satu produk, aplikasi memanfaatkan Navigator.push untuk membuka halaman ProdukDetail dan membawa data produk tersebut. Selain itu, terdapat tombol tambah pada bagian AppBar yang membuka ProdukForm agar pengguna dapat menambah produk baru.


### 2. ItemProduk
ItemProduk merupakan widget kecil yang bertugas menampilkan satu produk dalam bentuk kartu. Komponen ini hanya berisi tampilan sederhana berupa nama dan harga produk. Meskipun sederhana, widget ini memiliki interaksi. Ketika ditekan, widget ini mengarahkan pengguna ke ProdukDetail dan mengirimkan objek Produk yang sedang ditampilkan. Perpindahan dilakukan menggunakan MaterialPageRoute agar data dapat diteruskan secara langsung ke halaman berikutnya.


### 3. Halaman ProdukDetail
ProdukDetail berfungsi menampilkan informasi lengkap mengenai produk yang dipilih. Informasi seperti kode produk, nama, dan harga ditampilkan dalam bentuk teks. Pada halaman ini terdapat dua tombol utama, yaitu tombol edit dan tombol hapus. Tombol edit membuka ProdukForm dengan mengisi controller menggunakan data produk yang dibawa, sehingga pengguna bisa mengubah isi form. Tombol hapus menampilkan dialog konfirmasi menggunakan AlertDialog. Jika disetujui, aplikasi menghapus produk melalui ProdukBloc.deleteProduk. Jika permintaan gagal, aplikasi menampilkan WarningDialog sebagai pemberitahuan kesalahan.


### 4. Halaman ProdukForm
ProdukForm adalah halaman yang digunakan untuk menambah produk baru atau mengubah produk lama. Form menggunakan berbagai TextEditingController untuk membaca input seperti kode produk, nama produk, dan harga produk. Jika halaman dibuka dalam mode edit, fungsi isUpdate mengisi controller dengan nilai produk yang diterima. Jika tidak, form tampil kosong untuk menambah produk baru. Setiap input dilengkapi validator untuk memastikan data tidak kosong. Tombol submit memanggil proses validasi melalui _formKey.currentState.validate sebelum menjalankan logika penyimpanan atau pengubahan data.


### 5. Halaman LoginPage
LoginPage menyediakan form sederhana untuk masuk ke aplikasi. Pengguna mengisi email dan password melalui TextFormField yang sudah dilengkapi validator untuk memastikan kedua kolom terisi. Pada tahap ini proses autentikasi belum terhubung dengan backend, tetapi struktur form sudah siap untuk diintegrasikan. Jika pengguna belum memiliki akun, tersedia tautan untuk menuju RegistrasiPage melalui Navigator.push.


### 6. Halaman RegistrasiPage
RegistrasiPage digunakan untuk membuat akun baru. Halaman ini terdiri dari empat input yaitu nama, email, password, dan konfirmasi password. Validasi memastikan panjang nama mencukupi, format email benar, dan password sesuai dengan konfirmasi. Ketika tombol registrasi ditekan, aplikasi menyalakan indikator pemrosesan menggunakan variabel isLoading. Form ini pada tahap selanjutnya dapat dihubungkan dengan API registrasi CodeIgniter agar data pengguna tersimpan di server.


### 7. WarningDialog
WarningDialog adalah komponen dialog yang dipakai untuk menampilkan pesan peringatan ketika terjadi kegagalan proses. Komponen ini menampilkan teks pesan dan sebuah tombol untuk menutup dialog. Widget ini dibuat terpisah agar bisa digunakan ulang di berbagai halaman tanpa menulis ulang struktur AlertDialog.


### 8. ProdukBloc
ProdukBloc bertanggung jawab mengatur proses komunikasi antara aplikasi dan server. Fungsi getProduk mengambil data dari API menggunakan http.get dan mengubah data JSON menjadi objek Produk. Fungsi deleteProduk menghapus data berdasarkan ID melalui http.delete. Keberadaan ProdukBloc membuat kode di bagian UI menjadi lebih bersih karena logika API tidak ditulis langsung di halaman.
