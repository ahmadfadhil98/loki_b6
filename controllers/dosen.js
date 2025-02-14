const models = require('../models/index')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const cookieParser = require('cookie-parser')

const controllers = {}

controllers.dashboardDosen = async(req, res) => {
    res.render("dosen/dashboardDosen")
}

controllers.listRPS = async(req, res) => {
    res.render("dosen/listRPS")
}

controllers.tambahRPS = async(req, res) => {
    res.render("dosen/tambahRPS")
}

controllers.detailRPS = async(req, res) => {
    res.render("dosen/Pemrograman_Web/detailRPS")
}

controllers.cpmk = async(req, res) => {
    res.render("dosen/Pemrograman_Web/CPMK")
}

controllers.referensi = async(req, res) => {
    res.render("dosen/Pemrograman_Web/referensi")
}

controllers.komponenPenilaian = async(req, res) => {
    res.render("dosen/Pemrograman_Web/komponenPenilaian")
}

controllers.pertemuanMingguan = async(req, res) => {
    res.render("dosen/Pemrograman_Web/pertemuanMingguan")
}

module.exports = controllers