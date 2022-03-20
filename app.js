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

// Bagian Farhan (nomor 1 - 5?)

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

//assalamualaikum
