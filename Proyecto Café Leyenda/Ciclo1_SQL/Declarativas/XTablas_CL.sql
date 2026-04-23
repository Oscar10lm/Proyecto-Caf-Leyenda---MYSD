-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Ventas e Inventario
-- Archivo: XTablas.sql
-- Descripcion: Eliminacion de tablas
-- ADVERTENCIA: Ejecutar en este orden para respetar las FK
-- ============================================================

DROP TABLE DetalleVenta  CASCADE CONSTRAINTS;
DROP TABLE Venta         CASCADE CONSTRAINTS;
DROP TABLE Inventario    CASCADE CONSTRAINTS;
DROP TABLE Producto      CASCADE CONSTRAINTS;
DROP TABLE Categoria     CASCADE CONSTRAINTS;
DROP TABLE Empleado      CASCADE CONSTRAINTS;
DROP TABLE Cliente       CASCADE CONSTRAINTS;
DROP TABLE Usuario       CASCADE CONSTRAINTS;
DROP TABLE Cargo         CASCADE CONSTRAINTS;
DROP TABLE Pago          CASCADE CONSTRAINTS;