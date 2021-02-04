const express = require('express')
const app = express()
const mysql = require('mysql')
const bodyParser = require('body-parser')
const cors = require('cors')

app.set('view engine', 'ejs')
app.use(bodyParser.urlencoded({ extended:true}))


let conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'fseletro'
})

conn.connect((err) => {
    if (err) {
        console.log('Erro connecting to database...', err)
        return
    }
    console.log('Connection established!')
})

app.get('/', cors(), (req,res) => {
    conn.query("select * from produtos", (error,result) => {
        res.json(result)
    })
})

app.get('/pedidos', cors(), (req,res) => {
    conn.query("select * from pedidos", (error,result) => {
        res.json(result)
    })
})

app.listen(1900, () => {
    console.log('Servidor Funcionando');
})