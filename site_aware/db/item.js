const {connection} = require('./config');

function getItems() {
    return new Promise((resolve, reject) => {
        connection.query(`select * from item`, function(error, results, fields) {
            if(error) {
                reject(error)
            }else {
                resolve(results)
            }
        })
    })
};

function getItemById(id) {
    return new Promise((resolve, reject) => {
        connection.query(`select * from item where id = ?`, [id], function(error, results, fields) {
            if(error) {
                reject(error)
            }else {
                resolve(results)
            }
        })
    })
};

function getItemsByDept(id) {
    return new Promise((resolve, reject) => {
        connection.query(`select * from item where department_id = ?`, [id], function(error, results, fields) {
            if(error) {
                reject(error)
            }else {
                resolve(results)
            }
        })
    })
};

module.exports = {
    getItems,
    getItemById,
    getItemsByDept
}