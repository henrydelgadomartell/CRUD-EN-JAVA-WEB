/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion2 {
    Connection con;
    public Connection getConnection(){
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bdempleado","root","");
        } catch (Exception e){
            System.out.println("Error de conexión: " + e.getMessage());
        }
        return con;
    }
    }