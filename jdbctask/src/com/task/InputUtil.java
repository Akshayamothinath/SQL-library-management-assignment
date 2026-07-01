package com.task;

import java.util.Scanner;

public class InputUtil {

    public static String createDB(Scanner input) {
        return input.nextLine();
    }

    public static Student getStudent(Scanner input) {

        Student student = new Student();

        System.out.println("Enter Id:");
        student.setId(input.nextInt());
        input.nextLine();

        System.out.println("Enter Register Number:");
        student.setRegno(input.nextLine());

        System.out.println("Enter Name:");
        student.setName(input.nextLine());

        System.out.println("Enter Department:");
        student.setDept(input.nextLine());

        return student;
    }
}