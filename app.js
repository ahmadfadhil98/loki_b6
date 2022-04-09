const express = require('express')
const app = express()

const databaseRouter = require('./database');

const port = 3000

// Bagian test
app.get('/', (req, res) => {
  res.send('Hello World!')
})

// Router database (http://localhost:3000/database)
app.use("/", databaseRouter);

// Bagian Farhan (nomor 1 - 5)
// Nomor 1. Login
app.get('/login', function(request, response){
	response.send('Ini adalah halaman Login')
})

// Login (POST) (Tes http://localhost:3000/login di Postman)
app.post("/login", (req, res) => {
  let obj = {
    "Username": "admin",
    "Password": "****",
    "message": "Anda berhasil Login",
    "status": 1
  }
  res.json(obj);
});

// Nomor 2. Logout
app.get('/logout', function(request, response){
	response.send('Ini adalah halaman Logout')
})

// Logout (POST) (Tes http://localhost:3000/logout di Postman)
app.post("/logout", (req, res) => {
  let obj = {
    "message": "Anda berhasil Logout",
    "status": 0
  }
  res.json(obj);
});

// Nomor 3. Menentukan dosen yang akan membuat/memperbaharui RPS
app.get('/rps/pilih_dosen', function(request, response){
	response.send('Ini adalah halaman untuk menentukan dosen yang akan membuat/memperbaharui RPS')
})

// Menentukan dosen (POST) (Tes http://localhost:3000/pilih_dosen di Postman)
app.post("/rps/pilih_dosen", (req, res) => {
  let obj = {
    "message": "Tentukan dosen yang akan membuat/memperbaharui RPS",
    "Nama Dosen": "NAMA DOSEN",
    "Kode Dosen": "11897"
  }
  res.json(obj);
});

// Nomor 4. Lihat laporan RPS
app.get('/rps/laporan_rps', function(request, response){
	response.send('Ini adalah halaman untuk melihat laporan RPS yang ada')
})

// Lihat laporan RPS (POST) (Tes http://localhost:3000/rps/laporan_rps di Postman)
app.post("/rps/laporan_rps", (req, res) => {
  let obj = {
    "message": "Laporan RPS",
    "Mata Kuliah " :{
	  "Nama Mata Kuliah" : "Perancangan Basis Data",
	  "Kode Mata Kuliah" : "JSI62123",
	  "SKS" : "4 SKS",
	  "Semester" : "4",
	  "Kode Dosen" : "11897"
    }
  }
  res.json(obj);
});

// Nomor 5. Cetak RPS
app.get('/rps/cetak_rps', function(request, response){
	response.send('Ini adalah halaman untuk mencetak laporan RPS')
})

// Cetak RPS (POST) (Tes http://localhost:3000/rps/cetak_rps di Postman)
app.post("/rps/cetak_rps", (req, res) => {
  let obj = {
    "message": "Laporan RPS",
    "Mata Kuliah " :{
	  "Nama Mata Kuliah" : "Perancangan Basis Data",
	  "Kode Mata Kuliah" : "JSI62123",
	  "SKS" : "4 SKS",
	  "Semester" : "4",
	  "Kode Dosen" : "11897",
    },
    "Tombol cetak RPS": "CETAK"
  }
  res.json(obj);
});

//Bagian Ulfa (6-10)
//Nomor 6 (Fitur Tambah RPS)
app.get('/rps/tambah_rps', function(request, response){
	response.send('Ini adalah halaman untuk Menambahkan RPS Baru')
})

// Tambah RPS (POST) (Tes http://localhost:3000/rps/tambah_rps di Postman)
app.post("/rps/tambah_rps", (req, res) => {
	let obj = {
	  "message": "Tambahkan RPS",
	  "Mata Kuliah " :{
	  "Nama Mata Kuliah" : "Perancangan Basis Data",
	  "Kode Mata Kuliah" : "JSI62123",
	  "SKS" : "4 SKS",
	  "Semester" : "4",
	  "Kode Dosen" : "11897"
	  }
	}
	res.json(obj);
  });

	
//Nomor 7 (Mengubah RPS)
app.get('/rps/ubah_rps', function(request, response){
	response.send('Ini adalah halaman untuk mengubah RPS')
})
// Ubah RPS (POST) (Tes http://localhost:3000/rps/ubah_rps di Postman)
app.post("/rps/ubah_rps", (req, res) => {
	let obj = {
	  "message": "Silahkan Ubah RPS",
	  "Mata Kuliah " :{
	  "Nama Mata Kuliah" : "",
	  "Kode Mata Kuliah" : "",
	  "SKS" : "",
	  "Semester" : "",
	  "Kode Dosen" : ""
	  }
	}
	res.json(obj);
  });

//Nomor 8 (Revisi RPS Lama)
app.get('/rps/revisi_rps', function(request, response){
	response.send('Ini adalah halaman untuk Revisi RPS lama ke RPS Versi berikutnya')
})
// Revisi RPS (POST) (Tes http://localhost:3000/rps/revisi_rps di Postman)
app.post("/rps/revisi_rps", (req, res) => {
	let obj = {
	  "message": "Silahkan Revisi RPS",
	  "Mata Kuliah " :{
	  "Nama Mata Kuliah" : "",
	  "Kode Mata Kuliah" : "",
	  "SKS" : "",
	  "Semester" : "",
	  "Kode Dosen" : ""
	  }
	}
	res.json(obj);
  });
	
//Nomor 9 (Menambah CPMK Matkul)
app.get('/cpmk/tambah_cpmk', function(request, response){
	response.send('Ini adalah halaman untuk menambahkan CPMK Mata Kuliah')
})

// Tambah CPMK (POST) (Tes http://localhost:3000/cpmk/tambah_cpmk di Postman)
app.post("/cpmk/tambah_cpmk", (req, res) => {
	let obj = {
	  "message": "Silahkan Tambah CPMK",
	  "Mata Kuliah " : "PBD",
	  "CPMK " : "Mahasiswa memahami konsep dasar basis data"
	  
	  }
	
	res.json(obj);
  });



	
//Nomor 10 (Mengubah CPMK matkul)
app.get('/cpmk/ubah_cpmk', function(request, response){
	response.send('Ini adalah halaman untuk mengubah CPMK Mata Kuliah')
})
// Ubah CPMK (POST) (Tes http://localhost:3000/cpmk/ubah_cpmk di Postman)
app.post("/cpmk/ubah_cpmk", (req, res) => {
	let obj = {
	  "message": "Silahkan Ubah CPMK",
	  "Mata Kuliah " : "PBD",
	  "CPMK " : "Mahasiswa mampu melakukan analisis keperluan untuk menyusun deskripsi basis data. (S9, P2, KU2, KU10, KU11, KK2)"
	  
	  }
	
	res.json(obj);
  });

//Bagian Nadilla (11-15)
//Nomor 11 (Menghapus CPMK matkul)
app.get('/cpmk/hapus', function(request, response){
	response.send('Ini adalah halaman untuk menghapus CPMK Mata Kuliah')
})

//Hapus CPMK (DELETE) (Tes http://localhost:3000/cpmk/hapus di Postman)
app.delete("/cpmk/hapus", (req, res) => {
	let obj = {
	  "message": "Menghapus CPMK",
	  "Mata Kuliah " : "PBD",
	  "CPMK " : "Mahasiswa mampu melakukan analisis keperluan untuk menyusun deskripsi basis data. (S9, P2, KU2, KU10, KU11, KK2)",
	  "cek" : "Sukses",
	  "status" : 1
	  
	  }
	
	res.json(obj);
  });

//Nomor 12 (Menambah Referensi)
app.get('/referensi/tambah', function(request, response){
	response.send('Ini adalah halaman untuk menambah referensi')
})

//Tambah Referensi (POST) (Tes http://localhost:3000/referensi/tambah di Postman)
app.post("/referensi/tambah", (req, res) => {
	let obj = {
	  "message": "Menambahkan Referensi",
	  "Mata Kuliah " : "PBD",
	  "Referensi" : "Thomas Connolly and Carolyn Begg, Database Systems: A Practical Approach to Design, Implementation, and Management 6th Ed, Pearson Inc., 2014",
	  "cek" : "Sukses",
	  "status" : 1
	  
	  }
	
	res.json(obj);
  });

//Nomor 13 (Mengubah Referensi)
app.get('/referensi/ubah', function(request, response){
	response.send('Ini adalah halaman untuk mengubah referensi')
})

//Ubah Referensi (PUT) (Tes http://localhost:3000/referensi/ubah di Postman)
app.put("/referensi/ubah", (req, res) => {
	let obj = {
	  "message": "Mengubah Referensi",
	  "Mata Kuliah " : "PBD",
	  "Referensi" : "Thomas Connolly and Carolyn Begg, Database Systems: A Practical Approach to Design, Implementation, and Management 6th Ed, Pearson Inc., 2014",
	  "cek" : "Sukses",
	  "status" : 1
	  
	  }
	
	res.json(obj);
  });

//Nomor 14 (Menghapus Referensi)
app.get('/referensi/hapus', function(request, response){
	response.send('Ini adalah halaman untuk menghapus referensi')
})

//Hapus Referensi (DELETE) (Tes http://localhost:3000/referensi/hapus di Postman)
app.delete("/referensi/hapus", (req, res) => {
	let obj = {
	  "message": "Menghapus Referensi",
	  "Mata Kuliah " : "PBD",
	  "Referensi" : "Thomas Connolly and Carolyn Begg, Database Systems: A Practical Approach to Design, Implementation, and Management 6th Ed, Pearson Inc., 2014",
	  "cek" : "Sukses",
	  "status" : 1
	  
	  }
	
	res.json(obj);
  });

//Nomor 15 (Menambah Komponen Penilaian)
app.get('/nilai/tambah_nilai', function(request, response){
	response.send('Ini adalah halaman untuk menambah komponen penilaian')
})

// Tambah Nilai (POST) (Tes http://localhost:3000/nilai/tambah_nilai di Postman)
app.post("/nilai/tambah_nilai", (req, res) => {
	let obj = {
	  "message":"Menambah Komponen Nilai",
		"id_class":001,
		"Name":"PemWeb",
		"komponen":[
					  "1. Tugas   = 10%",
					  "3. UTS     = 25%",
					  "4. UAS     = 45%",
					  "5. Kuis    = 15%",
					  "6. Sikap   = 5%"
		 ]
	  }
	 res.json(obj);
	});

// Bagian Aisyah (nomor 16-19)
// Nomor 16 (Mengubah Komponen Penilaian)
app.get('/nilai/ubah_nilai', function(request, response){
	response.send('Ini adalah halaman Dosen Mengubah Komponen Penilaian')
})

// ubah_nilai (POST) (Tes http://localhost:3000/nilai/ubah_nilai di Postman)
app.post("/nilai/ubah_nilai", (req, res) => {
  let obj = {
    "message":"Update Komponen Nilai",
      "id_class":001,
      "Name":"PemWeb",
      "komponen":[
                    "1. Tugas       = 10%",
                    "2. UTS         = 25%",
                    "3. UAS         = 40%",
                    "4. Kuis        = 15%",
                    "5. Kehadiran   = 10%",
       ]
    }
   res.json(obj);
  });


// Nomor 17 (Menghapus Komponen Penilaian)
app.get('/nilai/hapus_nilai', function(request, response){
	response.send('Ini adalah halaman Dosen Menghapus Komponen Penilaian')
})

// hapus_nilai (POST) (Tes http://localhost:3000/nilai/hapus_nilai di Postman)
app.post("/nilai/hapus_nilai", (req, res) => {
  let obj = {
     "message":"Delete Data Komponen Nilai",
      "id_class":001,
      "Name":"PemWeb",
      "komponen":[
                    "1. Tugas       = 10%",
                    "2. UTS         = 25%",
                    "3. UAS         = 40%",
       ]
    }
    res.json(obj);
  });


// Nomor 18 (Menambah pertemuan mingguan RPS)
app.get('pertemuan/tambah_pertemuan', function(request, response){
	response.send('Ini adalah halaman Dosen menambah pertemuan mingguan RPS')
})

// tambah_pertemuan (POST) (Tes http://localhost:3000/pertemuan/tambah_pertemuan di Postman)
app.post("/pertemuan/tambah_pertemuan", (req, res) => {
  let obj = {
    "message": "Ini adalah halaman Dosen menambah pertemuan mingguan RPS",
    "status": 1
  }
  res.json(obj);
});

// Nomor 19 (Mengubah pertemuan mingguan yang ada dalam RPS.)
app.get('/pertemuan/mengubah_pertemuan', function(request, response){
	response.send('Ini adalah halaman Dosen mengubah pertemuan mingguan yang ada dalam RPS.')
})

// mengubah_pertemuan (POST) (Tes http://localhost:3000/pertemuan/mengubah_pertemuan di Postman)
app.post("/pertemuan/mengubah_pertemuan", (req, res) => {
  let obj = {
    "message": "Ini adalah halaman Dosen mengubah pertemuan mingguan yang ada dalam RPS.",
    "status": 1
  }
  res.json(obj);
});

// Bagian Faradila (Nomor 20-23)
// Nomor 20. Menghapus pertemuan mingguan yang ada dalam RPS)
app.get('/RPS/hapus_pertemuan', function(request, response){
	response.send('Ini adalah halaman Dosen menghapus pertemuan mingguan yang ada dalam RPS')
})
// hapus_pertemuan (DELETE) (Tes http://localhost:3000/RPS/hapus_Pertemuan di Postman)
app.delete("/RPS/hapus_pertemuan", (req, res) => {
  let obj = {
     "message":"Silahkan masukkan pertemuan yang akan dihapus",
      "id_class":"",
      "Name":"",
      "Jadwal":"",
	"Status" : 1
       
    }
    res.json(obj);
	console.log("\n\nBerhasil menghapus pertemuan mingguan\n");
  });

// Nomor 21. Pencarian berdasarkan nama mata kuliah atau kode matakuliah terhadap RPS yang ada)
app.get('/cari_matkul', function(request, response){
	response.send('Ini adalah halaman Pencarian')
})
// cari_matkul (GET) (Tes http://localhost:3000/RPS/cari_matkul di Postman)
app.get("/RPS/cari_matkul", (req, res) => {
  let obj = {
     "message":"silahkan masukkan nama/kode mata kuliah yang ingin dicari",
      "Mata kuliah":"",
    }
    res.json(obj);
	console.log("\n\nBerhasil melihat RPS mata kuliah yang dicari \n");
  });

// Nomor 22. Lihat detail RPS
app.get('/lihat_detail', function(request, response){
	response.send('Ini adalah halaman Mahasiswa lihat detail RPS')
})
// lihat_detail (GET) (Tes http://localhost:3000/RPS/lihat_detail di Postman)
app.get("/RPS/lihat_detail", (req, res) => {
  let obj = {
     "message":"Detail RPS",
      "Mata kuliah":"Pemweb",
	"Kode Mata kuliah":"JSI 101",
	  "SKS":"3 SKS",
	  "Prodi":"Sistem Informasi",
	  "Semester": 4,
	  "Kode Dosen": 123
    }
    res.json(obj);
	console.log("\n\nBerhasil melihat data detail RPS\n");
  });

// Nomor 23. Mengeksport RPS matakuliah menjadi PDF)
app.get('/eksport_PDF', function(request, response){
	response.send('Ini adalah halaman Pengguna mengeksport RPS matakuliah menjadi PDF')
})
// eksport_PDF (GET) (Tes http://localhost:3000/RPS/eksport_PDF di Postman)
app.get("/RPS/eksport_PDF", (req, res) => {
  let obj = {
     "message":"Silahkan masukkan RPS yang ingin di eksport ke PDF",
      "Mata kuliah":"Pemweb",
	"Kode Mata kuliah":"JSI 101",
	  "SKS":"3 SKS",
	  "Prodi":"Sistem Informasi",
	  "Semester": 4,
	  "Kode Dosen": 123
    }
    res.json(obj);
	console.log("\n\nBerhasil melakukan eksport ke PDF\n");
  });


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})


