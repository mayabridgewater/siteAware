var express = require('express');
var router = express.Router();

const {addOrder, addDetails} = require('../db/orders');

router.post('/', async function(req, res, next) {
    try {
        const order = await addOrder(req.body);
        const details = await addDetails(order[0][0].id, req.body.items);
        console.log('details: ', details)
    }catch(error) {
        console.log(error)
    }
})

module.exports = router