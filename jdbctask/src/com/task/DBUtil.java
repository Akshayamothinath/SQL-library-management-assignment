package com.task;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String USERNAME = "root";
    private static final String PASSWORD = "0530";
    private static final String URL = "jdbc:mysql://localhost:3306/";

    public static Connection getConnectionToServer()
            throws SQLException {

        return DriverManager.getConnection(
                URL,
                USERNAME,
                PASSWORD
        );
    }

    public static Connection getConnection(String dbName)
            throws SQLException {

        return DriverManager.getConnection(
                URL + dbName,
                USERNAME,
                PASSWORD
        );
    }
}