var express = require('express');
var router = express.Router();

const {getItems, getItemById, getItemsByDept} = require('../db/item');

router.get('/', async function(req, res, next) {
    try {
        const items = await getItems();
        res.status(200).json(items)
    }catch(error) {
        res.status(404).json({error: error.message})
    }
});

router.get('/:id', async function(req, res, next) {
    try{
        const item = await getItemById(req.params.id);
        res.status(200).json(item)
    }catch(error) {
        res.status(404).json({error: error.message})
    }
});

router.get('/department/:id', async function(req, res, next) {
    try {
        const items = await getItemsByDept(req.params.id);
        res.status(200).json(items)
    }catch(error) {
        res.status(404).json({error: error.message})
    }
})

module.exports = router;
