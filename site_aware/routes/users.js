var express = require('express');
var router = express.Router();

const {checkEmail, newRegister, newDetails} = require('../db/users');

router.post('/', async function(req, res, next) {
    try {
        let user = await checkEmail(req.body.email);
        if (!user.length) {
            user = await newRegister(req.body);
            user = user[0]
        }
        const details = await newDetails(user[0].id, req.body);
        res.status(200).json(details)
    }catch(error) {
        res.status(404).json({error: error.message})
    }
})

module.exports = router;