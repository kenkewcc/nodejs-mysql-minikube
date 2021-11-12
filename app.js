const mysql = require('mysql');
const express = require("express");
const app = express();

// create connection Pool to database
const pool = mysql.createPool ({
    host: 'test-mysql',
    user: 'root',
    password: 'password',
    database: 'test_db'
});

app.get("/",(req,res) => {
    pool.getConnection((err, connection) => {
        if(err) throw err;
        console.log('connected as id ' + connection.threadId);
        connection.query('SELECT message from challenge', (err, rows) => {
            connection.release(); // return the connection to pool
            if(err) throw err;
            console.log('The data from table are: \n', rows);
            res.send (rows);
        });
    });
});

app.listen(3000, () => {
    console.log('Server is running at port 3000');
});