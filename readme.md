<p align="center">
  <img src="https://genero.ues.edu.sv/wp-content/uploads/sites/48/2024/02/Logo-UES-2.png" width="120" alt="Logo UES" />
</p>

## Tarea 1 del Modulo 3
Creacion de proceso ETL para la construccion de un Dataware House para la base de datos transaccional Tailspin Toys

## Descripcion de contenido
1. <b>dimdates.csv</b> contiene la informacion para la tabla DimDates de enero 2020 a diciembre 2025
2. <b>CreateDatawareHouse.sql</b> contiene la instrucciones para crear la base de datos, dimensiones y tablas de hechos
3. <b>ModeloFisico-SpinToys.xls</b> contiene el detalle del modelo fisico del datawarehouse
4. <b>Tailspin Toys - Querys.sql</b> contiene las consultas realizadas a la base transaccional para realizar el llenado de las tablas de hechos y dimensiones
5. <b>Tarea1Modulo3</b> es el proyecto completo de VisualStudio Community 2022

## Enunciado del ejercicio practico

<h3>Ejercicio practico:</h3>

Construir un Datawarehouse para la gestion de ventas que se alimente de la base de datos
TailSpinToys que mantiene las transacciones realizadas por una empresa de venta de juguetes

La idea del DW es que puedan medir los niveles de venta por cantidad y precio.

Se deberan de considerar los siguientes aspectos:
1. En el modelo origen, existen atributos que estan no normalizados y que se convienten
en dimensiones basura (chunk)
2. Todas las dimensiones y todos sus atributos son de tipo SCD2
3. En esta base de datos hay 3 años de transacciones y por consiguiente la dimension de tiempo
debera tener al menos 5 años de fechas
4. La estrategia de este ejercicio es carga inicial

Para esta actividad, se deberan construir los siguientes puntos:
1. Diseño dimensional
2. Construir la BD de DW
3. Construir los ETL para todas las dimensiones y tabla de hechos, junto con un orquestador 
que ejecute todo a la vez

Fecha de entrega: 11 de agosto a traves de la plataforma.
Entregable: Enlace a un repositorio publico en Github

El ejercicio equivale al 30% de la evaluacion del modulo 3.

Es un ejercicio individual.

## Autor: Francisco Josue Escobar Quintanilla
## Carnet: EQ17001
## Año creacion de repositorio: 2025