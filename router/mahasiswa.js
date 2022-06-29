const express = require('express')
const app = express()

const listRPS = app.get('/listRPS',(req,res)=>{
    res.render(__dirname + '/views/mahasiswa/listRPS.ejs')
  })

module.exports = listRPS; 