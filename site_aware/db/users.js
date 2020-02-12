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

function GuestToRegister(id, {first_name, last_name, password, register}) {
    return new Promise((resolve, reject) => {
        connection.query(`call update_user(?,?,?,?,?)`, [id, first_name, last_name, password, register], function(error, results, fields) {
            if(error) {
                reject(error)
            }else {
                resolve(results)
            }
        })
    })
};

function getDetails(id) {
    return new Promise((resolve, reject) => {
        connection.query(`select * from user_details where user_id = ?`, [id], function(error, results, fields) {
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
};

function getUser({email, password}) {
    return new Promise((resolve, reject) => {
        connection.query(`select * from user where email = ? and password = ?`, [email, password], function(error, results, fields) {
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
    newDetails,
    getUser,
    GuestToRegister,
    getDetails
}