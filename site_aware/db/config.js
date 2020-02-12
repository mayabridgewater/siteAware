const mysql      = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'fattyb10',
  database : 'site_aware'
});



  module.exports = {
    connection
  }