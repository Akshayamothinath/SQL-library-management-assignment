package com.task;

import java.sql.*;

public class ServiceImpl
        implements Service {

    @Override
    public void createDatabase(
            String dbName) {

        String sql =
                "CREATE DATABASE IF NOT EXISTS "
                        + dbName;

        try (
                Connection con =
                        DBUtil.getConnectionToServer();

                Statement st =
                        con.createStatement()
        ) {

            st.executeUpdate(sql);

            System.out.println(
                    "Database created successfully"
            );

        } catch (Exception e) {
            System.out.println(
                    e.getMessage()
            );
        }
    }

    @Override
    public void createTable(
            String dbName) {

        String sql =
                "CREATE TABLE IF NOT EXISTS student("
                        + "id INT PRIMARY KEY,"
                        + "regno VARCHAR(20),"
                        + "name VARCHAR(50),"
                        + "dept VARCHAR(20)"
                        + ")";

        try (
                Connection con =
                        DBUtil.getConnection(dbName);

                Statement st =
                        con.createStatement()
        ) {

            st.executeUpdate(sql);

            System.out.println(
                    "Table created successfully"
            );

        } catch (Exception e) {
            System.out.println(
                    e.getMessage()
            );
        }
    }

    @Override
    public void insertData(
            String dbName,
            Student student) {

        String sql =
                "INSERT INTO student VALUES(?,?,?,?)";

        try (
                Connection con =
                        DBUtil.getConnection(dbName);

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    student.getId()
            );

            ps.setString(
                    2,
                    student.getRegno()
            );

            ps.setString(
                    3,
                    student.getName()
            );

            ps.setString(
                    4,
                    student.getDept()
            );

            int rows =
                    ps.executeUpdate();

            if (rows > 0) {
                System.out.println(
                        "Inserted Successfully"
                );
            }

        } catch (Exception e) {
            System.out.println(
                    e.getMessage()
            );
        }
    }

    @Override
    public void findAll(
            String dbName) {

        String sql =
                "SELECT * FROM student";

        try (
                Connection con =
                        DBUtil.getConnection(dbName);

                Statement st =
                        con.createStatement();

                ResultSet rs =
                        st.executeQuery(sql)
        ) {

            while (rs.next()) {

                System.out.println(
                        rs.getInt("id")
                                + " "
                                + rs.getString("regno")
                                + " "
                                + rs.getString("name")
                                + " "
                                + rs.getString("dept")
                );
            }

        } catch (Exception e) {
            System.out.println(
                    e.getMessage()
            );
        }
    }
}