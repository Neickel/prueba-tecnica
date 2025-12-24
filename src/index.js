const express = require('express');
const app = express();
const proyectosRoutes = require('./routes/proyectos');

app.use(express.json());
app.use('/api/proyectos', proyectosRoutes);
app.get('/', (req, res) => {
  res.send('API funcionando. Probá en /api/proyectos');
});
app.listen(3000, async () =>{
    console.log('servidor corriendo en http://localhost:3000');
});

