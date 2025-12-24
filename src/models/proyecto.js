const { DataTypes}  = require('sequelize');
const sequelize = require('../db/conexion');

const Proyecto = sequelize.define('Proyecto', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nombre: {
        type: DataTypes.STRING,
        allowNull: false
    },
    descripcion: {
        type: DataTypes.TEXT
    },
    fecha_inicio: {
        type: DataTypes.DATE
    },
    fecha_fin: {
        type: DataTypes.DATE
    },
    estado: {
        type: DataTypes.STRING
    },
    salon: {
        type: DataTypes.STRING
    }
}, {
    tableName: 'proyectos',
    timestamps:false
});

module.exports = Proyecto;