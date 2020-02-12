var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors = require('cors');
const crypto = require('crypto');


const departmentRouter = require('./routes/department');
const itemRouter = require('./routes/item');
const userRouter = require('./routes/users');
const orderRouter = require('./routes/orders');

var app = express();

app.use(cors({credentials: true, origin: 'http://localhost:3001'}));
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/department', departmentRouter);
app.use('/item', itemRouter);
app.use('/user', (req, res, next) => {
    if (req.body.password) {
        if(req.body.password.length < 4) {
            res.status(400).json({error: 'password too short'})
        }else {
            let token = crypto.pbkdf2Sync(req.body.password, 'siteAware', 100000, 64, 'sha512');
            token = token.toString('base64');
            req.body.password = token;
            next()
        }
    }else {
        next()
    }
},userRouter);
app.use('/order', orderRouter);


module.exports = app;
