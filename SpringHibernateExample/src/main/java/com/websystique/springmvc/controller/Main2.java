//package com.websystique.springmvc.controller;//package com.websystique.springmvc.controller;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.Statement;
//
//public class Main2 {
//    public static void main(String[] args) throws Exception {
//       String url = "jdbc:mysql://localhost:3306/";
//        String dbName = "websystique";
//       String driver = "com.mysql.jdbc.Driver";
//        String userName = "myuser";
//        String password = "mypassword";
//
//        Class.forName(driver).newInstance();
//
//       Connection conn = DriverManager.getConnection(url + dbName, userName, password);
//        Statement st = conn.createStatement();
//
//        int rows = st.executeUpdate("UPDATE pet SET active = NOT active");
//        if (rows == 0) {
//           System.out.println("Don't add any row!");
//       } else {
//            System.out.println(rows + " row(s)affected.");
//           conn.close();
//       }
//    }
//}