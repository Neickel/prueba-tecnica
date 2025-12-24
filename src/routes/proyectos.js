const express = require('express');
const router = express.Router();
const Proyecto = require('../models/proyecto');
const { assert } = require('console');

router.get('/', async (req, res) => {
    try{
        const proyectos =  await Proyecto.findAll();
        console.log('proyectos', proyectos);
        res.json(proyectos);
    } catch (error) {
  console.error('Error en GET /api/proyectos:', error); // log completo
  res.status(500).json({ error: error.message || 'Error desconocido' });
}
});

module.exports =  router;