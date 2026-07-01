package com.task;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner input =
                new Scanner(System.in);

        Service service =
                new ServiceImpl();

        while (true) {

            System.out.println(
                    "\n1.Create Database");
            System.out.println(
                    "2.Create Table");
            System.out.println(
                    "3.Insert Data");
            System.out.println(
                    "4.Display Data");
            System.out.println(
                    "5.Exit");

            System.out.println(
                    "Enter Choice:");

            int choice =
                    input.nextInt();
            input.nextLine();

            switch (choice) {

                case 1:

                    System.out.println(
                            "Enter Database Name:");

                    String dbName =
                            InputUtil
                                    .createDB(
                                            input);

                    service
                            .createDatabase(
                                    dbName);

                    break;

                case 2:

                    System.out.println(
                            "Enter Database Name:");

                    dbName =
                            input.nextLine();

                    service
                            .createTable(
                                    dbName);

                    break;

                case 3:

                    System.out.println(
                            "Enter Database Name:");

                    dbName =
                            input.nextLine();

                    Student student =
                            InputUtil
                                    .getStudent(
                                            input);

                    service
                            .insertData(
                                    dbName,
                                    student);

                    break;

                case 4:

                    System.out.println(
                            "Enter Database Name:");

                    dbName =
                            input.nextLine();

                    service
                            .findAll(
                                    dbName);

                    break;

                case 5:

                    System.exit(0);

                default:

                    System.out.println(
                            "Invalid Choice");
            }
        }
    }
}