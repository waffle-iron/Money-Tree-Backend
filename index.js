var mysql      = require('mysql');
var express    = require("express");
var session = require('express-session');
var bodyParser = require('body-parser');
var sess;//session variable
//Below command is to connect with database
var connection = mysql.createConnection({
    
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'moneytree'
});
var app = express();
app.use(session({secret: 'gmi'}));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});
connection.connect(function(err){
    if(!err) {
        console.log("Database is connected ... nn");    
    } else {
        console.log("Error connecting database ... nn");    
    }
});
app.listen(3000);
console.log("Server started on 3000 ... nn");    

app.post('/login',function(req,res){
  sess = req.session;
  if(req.body.username==null || req.body.password==null )
  {
    res.end('incomplete data');    
  }
  connection.query('SELECT * from login where username="'+req.body.username+'"and password="'+req.body.password+'"',
   function(err, rows, fields) {
        connection.end();
            if (!err)
                console.log('The solution is: ', rows);
            else
                console.log('Error while performing Query.');
        });
  req.body.username;
  sess.password=req.body.password;
  console.log(req.body.username);
  res.end(sess.username);
});
