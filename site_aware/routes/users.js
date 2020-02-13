var express = require('express');
var router = express.Router();

const {checkEmail, newRegister, newDetails, getUser, GuestToRegister, getDetails, getUserInfo} = require('../db/users');

router.post('/register', async function(req, res, next) {
    req.body.register = 'true';
    try {
        let user = await checkEmail(req.body.email);
        if (user.length) {
            if(user[0].password) {
                res.status(400).json({error: 'user already exists'})
            } else {
                await GuestToRegister(user[0].id, req.body); //add password to current guest user
            }
        }else {
            user = await newRegister(req.body); //create new registered user
            user = user[0]
        }
        const details = await newDetails(user[0].id, req.body);
        res.status(200).json(details)
    }catch(error) {
        res.status(404).json({error: error.message})
    }
});

router.post('/guest', async function(req, res, next) {
    try {
        let user = await checkEmail(req.body.email);
        if (!user.length ) {
            user = await newRegister(req.body);
            user = user[0]
        }
        const checkDetails = await getDetails(user[0].id);
        if (checkDetails.length) {
            for (let i = 0; i < checkDetails.length; i++) {
                if (checkDetails[i].address == req.body.address && 
                    checkDetails[i].city == req.body.city && 
                    checkDetails[i].phone == req.body.phone) {
                       
                        res.status(200).send(checkDetails[i]);
                        return
                }
            }
        }
        const details = await newDetails(user[0].id, req.body);
        res.status(200).json(details)
    }catch(error) {
        res.status(404).json({error: error.message})
    }
})

router.post('/login', async function(req, res, next) {
    try {
        const user = await getUser(req.body);
        res.cookie('login', JSON.stringify(user[0]), {maxAge: 1000 * 60 *60 *24});
        res.status(200).send(user)
    }catch(error) {
        res.status(404).json({error: error.message})
    }
})

router.get('/:id', async function(req, res, next) {
    try {
        const userInfo = await getUserInfo(req.params.id);
        res.status(200).send(userInfo)
    }catch(error) {
        res.status(404).json({error: error.message})
    }
})

module.exports = router;