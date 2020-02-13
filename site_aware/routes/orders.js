var express = require('express');
var router = express.Router();

const {addOrder, addDetails, getOrdersByUser} = require('../db/orders');

router.post('/', async function(req, res, next) {
    try {
        const order = await addOrder(req.body);
        const details = await addDetails(order[0][0].id, req.body.items);
        res.status(200).send(details)
    }catch(error) {
        res.status(404).json({error: error.message})
    }
});

router.get('/:id', async function(req, res, next) {
    try {
        const orders = await getOrdersByUser(req.params.id);
        res.status(200).send(orders)
    }catch(error) {
        res.status(404).json({error: error.message})
    }
})

module.exports = router