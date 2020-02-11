const {connection} = require('./config');

function checkEmail(email) {
    return new Promise((resolve, reject) => {
        connection.query(`select * from user where email = ?`, [email], function(error, results, fields) {
            if(error) {
                reject(error)
            }else {
                resolve(results)
            }
        })
    })
};

function newRegister({first_name, last_name, email, password, register}) {
    return new Promise((resolve, reject) => {
        connection.query(`call add_user(?,?,?,?,?)`, [first_name, last_name, email, password, register], function(error, results, fields) {
            if(error) {
                reject(error)
            }else {
                resolve(results)
            }
        })
    })
};

function newDetails(id, {address, city, phone}) {
    return new Promise((resolve, reject) => {
        connection.query(`call add_user_details(?,?,?,?)`, [id, address, city, phone], function(error, results, fields) {
            if(error) {
                reject(error)
            }else {
                resolve(results)
            }
        })
    })
}

module.exports = {
    checkEmail,
    newRegister,
    newDetails
}