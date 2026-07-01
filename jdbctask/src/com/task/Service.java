package com.task;

public interface Service {

    void createDatabase(String dbName);

    void createTable(String dbName);

    void insertData(String dbName,
                    Student student);

    void findAll(String dbName);
}
