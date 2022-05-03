package hau.case_study_furama_resort.common.exception;

import java.util.Scanner;

public class CheckException {
    private static Scanner scanner = new Scanner(System.in);
    public static int checkInt(int value) {
        boolean check = true;
        while (check) {
            try {
                value = Integer.parseInt(scanner.nextLine());
                check = false;
            } catch (NumberFormatException e) {
                System.err.println("Error: " + e.getMessage());
                System.out.println();
                System.out.print("Enter again: ");
                check = true;
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        }
        return value;
    }

    public static double checkDouble(double value) {
        boolean check = true;
        while (check) {
            try {
                value = Double.parseDouble(scanner.nextLine());
                check = false;
            } catch (NumberFormatException e) {
                System.err.println("Error: " + e.getMessage());
                System.out.println();
                System.out.print("enter again: ");
                check  = true;
            }catch (Exception e){
                System.err.println(e.getMessage());
            }
        }
        return value;
    }

    public static long checkLong(long value) {
        boolean check = true;
        while (check) {
            try {
                value = Long.parseLong(scanner.nextLine());
                check = false;
            } catch (NumberFormatException e) {
                System.err.println("Error: " + e.getMessage());
                System.out.println();
                System.out.print("enter again: ");
                check  = true;
            }catch (Exception e){
                System.err.println(e.getMessage());
            }
        }
        return value;
    }
}
