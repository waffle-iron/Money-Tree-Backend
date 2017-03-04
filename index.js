var mysql      = require('mysql');
var express    = require("express");
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'test'
});
var app = express();
connection.connect(function(err){
    if(!err) {
        console.log("Database is connected ... nn");    
    } else {
        console.log("Error connecting database ... nn");    
    }
});
app.listen(3000);
console.log("Server started on 3000 ... nn");    
app.get("/",function(req,res){
 connection.query('INSERT INTO `test` (`name`) VALUES ("Anshul_Chutya")');    
res.end();
});