const models = require('../models/index')

const controllers = {}

controllers.home = async(req, res) => {
    res.render("mahasiswa/dashboardMahasiswa" )
}

controllers.listRPS = async (req, res) => {
    const RPS = await models.course_plans.findAll({})
    res.render("mahasiswa/listRPS", {RPS} )
}


module.exports = controllers