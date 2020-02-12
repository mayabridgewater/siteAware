var express = require('express');
var router = express.Router();

const {addOrder, addDetails} = require('../db/orders');

router.post('/', async function(req, res, next) {
    try {
        const order = await addOrder(req.body);
        const details = await addDetails(order[0][0].id, req.body.items);
        res.status(200).send(details)
    }catch(error) {
        res.status(400).json({error: error.message})
    }
})

module.exports = router