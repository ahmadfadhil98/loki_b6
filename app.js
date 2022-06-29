const express = require('express')
const app = express()

const database = require('./config/database.js');

const port = 3000
require('dotenv').config()

// Bagian test
app.get('/', (req, res) => {
  res.render(__dirname + '/views/mahasiswa/dashboardMahasiswa.ejs')
})

app.get('/listRPS',(req,res)=>{
  res.render(__dirname + '/views/mahasiswa/listRPS.ejs')
})

app.get('/dosen/listRPS',(req,res)=>{
  res.render(__dirname + '/views/dosen/listRPS.ejs')
})

app.get('/login',(req,res)=>{
  res.render(__dirname + '/views/login.ejs')
})


app.get('/Pemrograman_Web/detailRPS',(req,res)=>{
  res.render(__dirname + '/views/mahasiswa/Pemrograman_Web/detailRPS.ejs')
})

app.get('/tambahRPS',(req,res)=>{
  res.render(__dirname + '/views/dosen/tambahRPS.ejs')
})

app.use(express.static('views'));
// app.use(express.static('vendors'));
// // app.use(express.static('css'));
// app.use(express.static('js'));
// app.use(express.static('assets'));
// Specific folder example

app.use('', express.static(__dirname + ''))
app.use('/styles', express.static(__dirname + 'views/styles'))
app.use('/img', express.static(__dirname + 'views/img'))

app.set('views', '/views');
app.set('view engine', 'ejs');

app.use(express.json())
app.use(express.urlencoded({extended : true}))
// app.use(cookieParser())

database.authenticate()
  .then(() => {
    console.log('Berhasil terhubung database');
  })
  .catch(err => {
    console.error(`Gagal terhubung : ${err}`);
  });

  app.listen(port, () =>
{
    console.log(`Server sudah berjalan di port ${port}`)
})