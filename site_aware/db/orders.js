const {connection} = require('./config');

function addOrder({user_id, details_id, total}) {
    return new Promise((resolve, reject) => {
        connection.query(`call add_order(?,?,?)`, [user_id, details_id, total], function(error, results, fields) {
            if(error) {
                reject(error)
            }else {
                resolve(results)
            }
        })
    })
};

function addDetails(order_id, items) {
    let query = '';
    let params = [];
    for (let i = 0; i < items.length; i++) {
        query += '(?, ?, ?, ?, ?)';
        params.push(order_id, items[i].id, items[i].quantity, items[i].weight, items[i].comment)
        if (i < items.length-1) {
            query += ', '
        }
    }
    return new Promise((resolve, reject) => {
        connection.query(`insert into order_detail (order_id, item_id, quantity, weight, comment) values ${query}`, params, function(error, results, fields) {
            if(error) {
                reject(error)
            }else {
                resolve(results)
            }
        })
    })
};

module.exports = {
    addOrder,
    addDetails
}