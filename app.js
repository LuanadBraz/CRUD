// inicio do servidor
//recebendo as bibliotecas

const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const handlebars = require('express-handlebars');
const app = express();
const urlencodeParser = bodyParser.urlencoded({extended: false});


//criar conexão com banco de dados
const sql = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    port: 3306
});

sql.query("use crud");
app.use('/img', express.static('img'));
app.use('/css', express.static('css'));
app.use('/js', express.static('js'));


//Template Handlebars
app.engine("handlebars", handlebars({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

//Templates
app.get("/", function (req, res) {
    res.render('index');
});
app.get("/inserir", function (req, res) {
    res.render("inserir");
});

//Selecionando Dados
app.get("/select/:id?", function (req, res) {
    if (!req.params.id) {
        sql.query("select * from usuario order by id asc", function (err, results, fields) {
            res.render('select', {data: results});
        });
    } else {
        sql.query("select * from usuario where id=? order by id asc", [req.params.id], function (err, results, fields) {
            res.render('select', {data: results});
        });
    }
});


//Inserindo Dados
app.post("/controllerForm", urlencodeParser, function (req, res) {
    sql.query("insert into usuario values(?,?,?,?,?,?,?)", [
        req.body.id,
        req.body.name,
        req.body.idade,
        req.body.civil,
        req.body.cpf,
        req.body.cidade,
        req.body.estado
    ]);
    res.render('controllerForm');
});

//Deletar
app.get('/deletar/:id', function (req, res) {
    sql.query("delete from usuario where id=?", [req.params.id]);
    res.render('deletar');
});

//Atualizar os dados
app.get("/update/:id",function(req,res){
    sql.query("select * from usuario where id=?",[req.params.id],function(err,results,fields){
        res.render('update',{id:req.params.id,nome:results[0].nome,
        idade:results[0].idade,
        civil:results[0].civil,
        cpf:results[0].cpf,
        cidade:results[0].cidade,
        estado:results[0].estado});
    });
});

//Cont. Atualizar os dados
app.post("/controllerUpdate",urlencodeParser,function(req,res){
    sql.query("update usuario set nome=?,idade=?,civil=?,cpf=?,cidade=?,estado=? where id=?",
        [req.body.nome,
         req.body.idade,
         req.body.civil,
         req.body.cpf,
         req.body.cidade,
         req.body.estado,
         req.body.id])
    res.render('controllerUpdate');
});

//Start Server
app.listen(3000, function (req, res) {
    console.log('Servidor está Rodando!')
});


