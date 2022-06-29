const express = require('express')
const server = express.Router()
const controllers = require('../controllers/index.js')

server.get('/', controllers.mhs.home)
server.get('/listRPS',controllers.mhs.listRPS)

module.exports = server