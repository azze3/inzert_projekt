package cz.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestJdbc {

public static void main(String[] args) {

    String jdbcUrl = "jdbc:mysql://localhost:3306/hb_student_tracker?useSSL=false";
    String user = "admin";
    String pass = "Heslo";


    try {
        System.out.println("Conn to DB: " + jdbcUrl);
        Connection myConn = DriverManager.getConnection(jdbcUrl, user, pass);
        System.out.println("Conn to DB succesful!");

    } catch (SQLException e) {
        e.printStackTrace();
    }
}
}
