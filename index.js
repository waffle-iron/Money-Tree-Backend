var mysql = require('mysql');
var express = require("express");
var session = require('express-session');
var bodyParser = require('body-parser');
var sess; //session variable
//Below command is to connect with database
var connection = mysql.createConnection({

    host: 'localhost',
    user: 'root',
    password: '',
    database: 'moneytree'
});
var app = express();
//secret key is must to set to working with sesssions in express
app.use(session({
    secret: 'gmi'
}));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));
//Below code is to enable CORS in node server
app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});
//DB connection function
function db_connect() {
    connection.connect(function (err) {
        if (!err) {
            console.log("Database is connected ... nn");
        } else {
            console.log("Error connecting database ... nn");
        }
    });
}
//Server listen port  is 3000
app.listen(3000);
console.log("Server started on 3000 ... nn");
//login post method
app.post('/login', function (req, res) {
    sess = req.session;
    if (req.body.username == null || req.body.password == null) {
        res.json({
            status: 'incomplete data'
        });
        res.end();
    } else {
        db_connect();
        connection.query('SELECT * from login where username="' + req.body.username + '"and password="' + req.body.password + '"',
            function (err, rows, fields) {
                connection.end();
                if (!err) {
                    if (rows.length == 1) {
                        //setting session variables
                        sess.access_type = rows.access_type;
                        sess.pm_id = rows.pm_id;
                        sess.et_id = rows.et_id;
                        sess.login='true';
                        res.json({
                            status: 'succesful'
                        });
                        res.end();
                    } else {
                        res.json({
                            status: 'failure'
                        });
                        res.end();
                    }
                } else {
                    console.log('Error while performing Query.');
                    res.end();
                }
            });
    }
});