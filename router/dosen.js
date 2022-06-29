const express = require('express')
const server = express.Router()
const controllers = require('../controllers/index.js')
const cekLogin = require('../middleware/cekLogin.js')
const cekDosenPengampu = require('../middleware/cekDosenPengampu.js')



server.get('/dosen/dashboardDosen',controllers.dosen.dashboardDosen)
server.get('/dosen/listRPS',controllers.dosen.listRPS)
server.get('/dosen/tambahRPS',controllers.dosen.tambahRPS)
server.get('/dosen/detailRPS',controllers.dosen.detailRPS)

module.exports = server