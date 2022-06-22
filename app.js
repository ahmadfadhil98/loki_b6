const express = require('express')
const app = express()

const database = require('./config/database.js');

const port = 3000
require('dotenv').config()

// Bagian test
app.get('/', (req, res) => {
  res.send('Hello World!')
})

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