# Tugas 9 Praktikum Pemrograman Mobile
## Identitas

Nama: Adeyunita Rachmadhani

NIM: H1D023057

Shift Baru: E

Shift KRS: F

## Screenshot

<table>
  <tr>
    <td align="center">
      <b>Tampilan Login</b><br><br>
      <img src="https://github.com/user-attachments/assets/0b00e322-5231-4970-bef3-7555e9c0a573" width="300">
    </td>
    <td align="center">
      <b>Tampilan Register</b><br><br>
      <img src="https://github.com/user-attachments/assets/8d8bbb37-eb02-4766-975b-875eab752109" width="300">
    </td>
  </tr>

  <tr>
    <td align="center">
      <b>Registrasi (Isi Form)</b><br><br>
      <img src="https://github.com/user-attachments/assets/d27a1883-7a89-45e8-915f-7d381d4cec14" width="300">
    </td>
    <td align="center">
      <b>Berhasil Registrasi</b><br><br>
      <img src="https://github.com/user-attachments/assets/b754fc72-345e-4477-972f-48b7d8d4de8e" width="300">
    </td>
  </tr>

  <tr>
    <td align="center">
      <b>Login (Input Benar)</b><br><br>
      <img src="https://github.com/user-attachments/assets/85e51a81-58d4-4cf1-a522-87c00a58953e" width="300">
    </td>
    <td align="center">
      <b>List Produk</b><br><br>
      <img src="https://github.com/user-attachments/assets/707aeb03-a692-4b93-8f02-bed2b5334710" width="300">
    </td>
  </tr>

  <tr>
    <td align="center">
      <b>Tambah Produk</b><br><br>
      <img src="https://github.com/user-attachments/assets/c850e656-376b-4429-87cc-c647a1848820" width="300">
    </td>
    <td align="center">
      <b>List Produk Setelah Ditambah</b><br><br>
      <img src="https://github.com/user-attachments/assets/3c3e332e-718e-43ef-9170-83f787e6f94f" width="300">
    </td>
  </tr>

  <tr>
    <td align="center">
      <b>Detail Produk</b><br><br>
      <img src="https://github.com/user-attachments/assets/6b367465-b582-4a88-b560-bb5c83c2b6c1" width="300">
    </td>
    <td align="center">
      <b>Edit Produk</b><br><br>
      <img src="https://github.com/user-attachments/assets/3fce379d-ba4c-42c9-8d5d-66aea1d2f44c" width="300">
    </td>
  </tr>

  <tr>
    <td align="center">
      <b>Detail Setelah Diedit</b><br><br>
      <img src="https://github.com/user-attachments/assets/acca74b3-e46e-4ad5-9025-a4d0d93ea3cb" width="300">
    </td>
    <td align="center">
      <b>Hapus Produk</b><br><br>
      <img src="https://github.com/user-attachments/assets/ef2eea19-db8f-438c-8166-7c530dbc370e" width="300">
    </td>
  </tr>

  <tr>
    <td align="center">
      <b>Logout</b><br><br>
      <img src="https://github.com/user-attachments/assets/8ab179ee-4c41-4113-8f68-6d44ec76c80b" width="300">
    </td>
  </tr>
</table>



## Penjelasan Proses Passing Data
### 1. Login
Login adalah proses untuk memastikan bahwa hanya user yang sudah terdaftar dan memiliki data valid yang bisa masuk ke aplikasi.
Ketika pengguna menekan tombol "Login", yang terjadi adalah:

**a. Flutter mengambil input email & password**

Flutter tidak langsung memvalidasi ke database, hanya mengecek field kosong.

**b. Flutter mengirim request ke API CI4**

Request dikirim melalui method: `LoginBloc.login(email: ..., password: ...)`

yang kemudian memanggil API: `POST /login`

**c. CodeIgniter mengecek data user**

CI4 mencari data user berdasarkan email. Jika email tidak ditemukan maka API langsung balas error. Jika email ditemukan, CI4 mencocokkan password menggunakan: `password_verify($password, $member['password'])`

**d. Jika password cocok maka CI4 membuat token baru**

Token ini bukan JWT, tetapi string acak (RandomString) yang berfungsi sebagai tanda bahwa user “sudah login”. Token disimpan di database melalui model MLogin. Token dan data user dikirim kembali ke Flutter. Flutter menyimpan token menggunakan SharedPreferences.

**e. Aplikasi otomatis masuk ke halaman Produk**

Karena token sudah tersimpan, halaman home langsung diarahkan ke ProdukPage.


### 2. Registrasi User
Registrasi digunakan untuk membuat akun baru. Data yang dimasukkan user disimpan ke tabel member.

Alurnya:

**a. User mengisi nama, email, password.**

**b. Flutter mengirim ke endpoint:** `POST /registrasi`

**c. CI4 menerima data lalu:**

mengenkripsi password

menyimpan data user baru

mengirim response bahwa registrasi berhasil

### 3. Menampilkan List Produk
Ini adalah proses mendapatkan daftar produk dari server.

Alurnya:

**a. Flutter menjalankan:** `ProdukBloc.getProduks()`

**b. Fungsi tersebut memanggil:**
`GET /produk`

**c. CI4 mengambil seluruh data dari tabel produk menggunakan findAll().**

**d. Data dikirim balik ke Flutter dalam bentuk JSON.**

**e. Flutter mengubah JSON menjadi objek Produk.**

**f. Produk ditampilkan dalam ListTile.**


### 4. Tambah Produk
Proses menambah produk terdiri dari:

**a. User mengisi form (kode, nama, harga).**

**b. Flutter membuat objek Produk baru.**

**c. Flutter memanggil:** `POST /produk`

**d. CI4 menerima data, lalu:**

validasi sederhana

insert data

mengambil kembali produk yang baru diinsert

mengembalikannya ke Flutter

### 5. Ubah Produk
Saat user memilih item produk:

**a. Flutter mengisi form dengan data lama (prefill).**

**b. User mengubah data.**

**c. Flutter mengirim permintaan:** `PUT /produk/{id}`

**d. CI4 memperbarui produk berdasarkan ID.**

### 6. Hapus Produk
Proses:

**a. User menekan tombol delete.**

**b. Flutter mengirim request:** `DELETE /produk/{id}`

**c. CI4 menghapus baris data produk.**

**d. Flutter memuat ulang daftar produk.**