const express = require('express')
const app = express()
const port = 3000

// Bagian test
app.get('/', (req, res) => {
  res.send('Hello World!')
})
//terserah

app.get('/about', function(request, response){
	response.send('Ini adalah halaman About')
})

// Bagian Farhan (nomor 1 - 5)
// Nomor 1. Login
app.get('/login', function(request, response){
	response.send('Ini adalah halaman Login')
})

// Nomor 2. Logout
app.get('/logout', function(request, response){
	response.send('Ini adalah halaman Logout')
})

// Nomor 3. Menentukan dosen yang akan membuat/memperbaharui RPS
app.get('/pilih_dosen', function(request, response){
	response.send('Ini adalah halaman untuk menentukan dosen yang akan membuat/memperbaharui RPS')
})

// Nomor 4. Lihat laporan RPS
app.get('/laporan_rps', function(request, response){
	response.send('Ini adalah halaman untuk melihat laporan RPS yang ada')
})

// Nomor 5. Cetak RPS
app.get('/cetak_laporan', function(request, response){
	response.send('Ini adalah halaman untuk mencetak laporan RPS')
})

//Bagian Ulfa (6-10)
//Nomor 6 (Fitur Tambah RPS)
app.get('/tambah_rps', function(request, response){
	response.send('Ini adalah halaman untuk Menambahkan RPS Baru')
})
	
//Nomor 7 (Mengubah RPS)
app.get('/ubah_rps', function(request, response){
	response.send('Ini adalah halaman untuk mengubah RPS')
})

//Nomor 8 (Revisi RPS Lama)
app.get('/revisi_rps', function(request, response){
	response.send('Ini adalah halaman untuk Revisi RPS lama ke RPS Versi berikutnya')
})
	
//Nomor 9 (Menambah CPMK Matkul)
app.get('/tambah_cpmk', function(request, response){
	response.send('Ini adalah halaman untuk menambahkan CPMK Mata Kuliah')
})
	
//Nomor 10 (Mengubah CPMK matkul)
app.get('/ubah_cpmk', function(request, response){
	response.send('Ini adalah halaman untuk mengubah CPMK Mata Kuliah')
})

//Bagian Nadilla (11-15)
//Nomor 11 (Menghapus CPMK matkul)
app.get('/hapus_cpmk', function(request, response){
	response.send('Ini adalah halaman untuk menghapus CPMK Mata Kuliah')
})

//Nomor 12 (Menambah Referensi)
app.get('/tambah_referensi', function(request, response){
	response.send('Ini adalah halaman untuk menambah referensi')
})

//Nomor 13 (Mengubah Referensi)
app.get('/ubah_referensi', function(request, response){
	response.send('Ini adalah halaman untuk mengubah referensi')
})

//Nomor 14 (Menghapus Referensi)
app.get('/hapus_referensi', function(request, response){
	response.send('Ini adalah halaman untuk menghapus referensi')
})

//Nomor 15 (Menambah Komponen Penilaian)
app.get('/tambah_nilai', function(request, response){
	response.send('Ini adalah halaman untuk menambah komponen penilaian')
})

// Bagian Aisyah (nomor 16-19)
// Nomor 16 (Mengubah Komponen Penilaian)
app.get('/ubah_nilai', function(request, response){
	response.send('Ini adalah halaman Dosen Mengubah Komponen Penilaian')
})

// Nomor 17 (Menghapus Komponen Penilaian)
app.get('/Hapus_nilai', function(request, response){
	response.send('Ini adalah halaman Dosen Menghapus Komponen Penilaian')
})

// Nomor 18 (Menambah pertemuan mingguan RPS)
app.get('/tambah_pertemuan', function(request, response){
	response.send('Ini adalah halaman Dosen menambah pertemuan mingguan RPS')
})

// Nomor 19 (Mengubah pertemuan mingguan yang ada dalam RPS.)
app.get('/mengubah_pertemuan', function(request, response){
	response.send('Ini adalah halaman Dosen mengubah pertemuan mingguan yang ada dalam RPS.')
})

// Bagian Faradila (Nomor 20-23)
// Nomor 20. Menghapus pertemuan mingguan yang ada dalam RPS)
app.get('/hapus_pertemuan', function(request, response){
	response.send('Ini adalah halaman Dosen menghapus pertemuan mingguan yang ada dalam RPS')
})

// Nomor 21. Pencarian berdasarkan nama mata kuliah atau kode matakuliah terhadap RPS yang ada)
app.get('/cari_matkul', function(request, response){
	response.send('Ini adalah halaman Pencarian')
})

// Nomor 22. Lihat detail RPS
app.get('/lihat_detail', function(request, response){
	response.send('Ini adalah halaman Mahasiswa lihat detail RPS')
})

// Nomor 23. Mengeksport RPS matakuliah menjadi PDF)
app.get('/eksport_RPS', function(request, response){
	response.send('Ini adalah halaman Pengguna mengeksport RPS matakuliah menjadi PDF')
})


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})


