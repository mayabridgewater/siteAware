var express = require('express');
var router = express.Router();

const {getDepartments} = require('../db/home');

router.get('/', async function(req, res, next) {
  console.log('in route')
  try {
    const departments = await getDepartments();
    console.log('departments: ', departments)
  } catch(error) {
    console.log('error: ', error)
  }
});

module.exports = router;
