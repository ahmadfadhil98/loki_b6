const express = require('express')
const router = express.Router()
const mysql=require('mysql2')

router.get('/database', function(req, res, next){
	const connection=mysql.createConnection({
		host:'localhost',
		user:'root',
		password:'',
		database:'loki'
	});
	connection.connect();
	console.log("Berhasil connect ke database loki") // Lihat di CMD
	
	// Tes di localhost:3000/database (ditampilkan data dari tabel users)
	connection.query('SELECT id, name, email, type FROM users', function(err, rows, fields){
		if (err) throw err;
		res.json(rows);
	})
});
module.exports = router;
