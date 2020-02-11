var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors = require('cors');

const departmentRouter = require('./routes/department');
const itemRouter = require('./routes/item');
const userRouter = require('./routes/users');
const orderRouter = require('./routes/orders');

var app = express();

app.use(cors());
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/department', departmentRouter);
app.use('/item', itemRouter);
app.use('/user', userRouter);
app.use('/order', orderRouter);


module.exports = app;
