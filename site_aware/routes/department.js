var express = require('express');
var router = express.Router();

const {getDepartments, getDepartmentById} = require('../db/department');

router.get('/', async function(req, res, next) {
  console.log('in route')
  try {
    const departments = await getDepartments();
    res.status(200).json(departments)
  } catch(error) {
    res.status(404).json({error: error.message})
  }
});

router.get('/:id', async function(req, res, next) {
  try {
    const department = await getDepartmentById(req.params.id);
    res.status(200).json(department)
  }catch(error) {
    res.status(404).json({error: error.message})
  }
});

module.exports = router;
