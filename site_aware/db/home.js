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
}

module.exports = {
    getDepartments
}