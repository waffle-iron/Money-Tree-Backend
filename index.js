var mysql = require('mysql');
var express = require("express");
var session = require('express-session');
var bodyParser = require('body-parser');
var sess; //global session variable
//Below command is to connect with database
var connection = mysql.createConnection({

    host: 'localhost',
    user: 'root',
    password: '',
    database: 'moneytree'
});
//Creating Pool of connection
var pool = mysql.createPool({
    connectionLimit: 100, //important
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'moneytree',
    debug: false
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
app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

function login(req, res) {
    sess = req.session;
    console.log('got login request');
    if (req.body.username == null || req.body.password == null) {
        res.json({
            status: 'incomplete data'
        });
        res.end();
        return;
    }
    pool.getConnection(function(err, connection) {
        if (err) {
            res.json({
                "code": 100,
                "status": "Error in connection database"
            });
            return;
        }
        connection.query('SELECT * from credentials where username="' + req.body.username + '"and password="' + req.body.password + '"',
            function(err, rows, fields) {
                connection.release();
                if (!err) {
                    if (rows.length == 1) {
                        //setting session variables
                        sess.access_type = rows[0].access_type;
                        sess.pm_id = rows[0].pm_id;
                        sess.et_id = rows[0].et_id;
                        sess.login = 'true';
                        res.json({
                            status: 'succesful',
                            access_type: rows[0].access_type
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
        connection.on('error', function(err) {
            res.json({
                "status": "Error in connection database"
            });
            return;
        });
    });
}

function create_order(req, res) {
    sess = req.session;
    if (req.body.side == null || req.body.s_id == null || req.body.quantity == null) {
        res.json({
            status: 'incomplete data'
        });
        res.end();
    }

    pool.getConnection(function(err, connection) {
        if (err) {
            res.json({
                "code": 100,
                "status": "Error in connection database"
            });
            return;
        }
        connection.query("INSERT INTO orders VALUES (NULL, '" + req.body.side + " ',' " + req.body.symbol + "', '" + req.body.quantity + "', '" + req.body.limit_price + "', '" + req.body.stop_loss + "', '" + req.body.quantity + "', '" + 0 + "', '" + "open" + "', '" + req.body.et_id + "', '" + sess.pm_id + "', '" + req.body.s_id + "','" + req.body.current_price + "','" + (new Date().toLocaleString) + "')",
            function(err, rows, fields) {
                connection.release();
                if (!err) {
                    res.json({
                        status: 'succesful'
                    });
                    res.end();
                } else {
                    console.log(err);
                }

            })
        res.end();
    });
}

//Server listen port  is 3000
app.listen(3000);
console.log("Server started on 3000 ... nn");
//login post method
app.post('/login', function(req, res) {
    login(req, res);
});
app.post('/create_order', function(req, res) {
    create_order(req, res);
});