const express = require('express')
const app = express()
const port = 3000

// Bagian test
app.get('/', (req, res) => {
  res.send('Hello World!')
})

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




app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})


