-- =====================================================
-- Simple Epidemiological Database Initialization Script
-- Creates one table with sample patient data
-- =====================================================

USE master;
GO

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'EpidemiologyDB')
BEGIN
    CREATE DATABASE EpidemiologyDB;
END;
GO

USE EpidemiologyDB;
GO

-- Drop table if exists
IF OBJECT_ID('PatientData', 'U') IS NOT NULL
    DROP TABLE PatientData;
GO

-- Create table
CREATE TABLE PatientData (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    GENDER CHAR(1) NOT NULL CHECK (GENDER IN ('M', 'F')),
    AGE INT NOT NULL CHECK (AGE >= 0 AND AGE <= 120),
    WEIGHT DECIMAL(5,2) NOT NULL CHECK (WEIGHT > 0),
    BMI DECIMAL(4,1) NOT NULL CHECK (BMI > 0)
);
GO

-- Insert 50 rows of sample data
INSERT INTO PatientData (GENDER, AGE, WEIGHT, BMI) VALUES
('M', 45, 78.5, 24.2),
('F', 32, 65.2, 22.1),
('M', 28, 82.1, 26.5),
('F', 55, 70.8, 25.3),
('M', 41, 95.3, 29.8),
('F', 29, 58.4, 20.7),
('M', 67, 85.9, 27.4),
('F', 34, 72.1, 23.9),
('M', 52, 88.7, 28.1),
('F', 26, 61.3, 21.5),
('M', 39, 79.6, 25.8),
('F', 48, 68.9, 24.6),
('M', 31, 76.2, 23.4),
('F', 44, 74.5, 26.2),
('M', 58, 92.1, 30.1),
('F', 22, 55.7, 19.8),
('M', 36, 81.3, 25.9),
('F', 51, 66.8, 23.7),
('M', 43, 87.4, 27.6),
('F', 27, 63.2, 22.3),
('M', 62, 89.5, 28.9),
('F', 35, 69.7, 24.1),
('M', 47, 84.8, 26.7),
('F', 30, 59.1, 20.9),
('M', 54, 91.2, 29.4),
('F', 42, 71.4, 25.5),
('M', 33, 77.9, 24.8),
('F', 49, 67.3, 23.2),
('M', 56, 86.6, 27.8),
('F', 24, 57.8, 21.1),
('M', 40, 83.7, 26.3),
('F', 46, 73.2, 24.7),
('M', 29, 75.5, 23.6),
('F', 53, 70.1, 25.8),
('M', 37, 80.4, 25.1),
('F', 31, 62.6, 22.7),
('M', 64, 88.9, 28.3),
('F', 28, 64.8, 23.5),
('M', 50, 85.2, 27.1),
('F', 38, 66.5, 24.3),
('M', 45, 79.8, 25.4),
('F', 41, 72.7, 26.1),
('M', 59, 90.3, 29.2),
('F', 25, 56.9, 20.4),
('M', 48, 82.6, 26.8),
('F', 44, 68.1, 24.9),
('M', 35, 78.2, 24.5),
('F', 52, 71.9, 25.7),
('M', 42, 84.1, 27.3),
('F', 33, 60.4, 21.8);
GO

-- Verify data was inserted
SELECT COUNT(*) as TotalRows FROM PatientData;
GO
