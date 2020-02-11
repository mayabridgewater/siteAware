const {connection} = require('./config');

function getDepartments() {
    return new Promise((resolve, reject) => {
        connection.query(`select * from department`, function(error, results, fields) {
            if(error) {
                reject(error)
            }else {
                resolve(results)
            }
        })
    })
};

function getDepartmentById(id) {
    return new Promise((resolve, reject) => {
        connection.query(`select * from department where id = ?`, [id], function(error, results, fields) {
            if(error) {
                reject(error)
            }else {
                resolve(results)
            }
        })
    })
}

module.exports = {
    getDepartments,
    getDepartmentById
}