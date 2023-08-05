import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner vyborIgry = new Scanner(System.in);
        boolean newGame = true;
        while (newGame){
            newGame = false;
            System.out.println("Выберите:");
            System.out.println("1 - Пирамида");
            System.out.println("2 - Змейка");
            System.out.println();
            System.out.println("0 - Выход");
            int choice = 0;
            Object game;
            if (vyborIgry.hasNextInt()) choice = vyborIgry.nextInt();
            switch (choice) {
                case 0 -> System.exit(0);
                case 1 -> game = new Piramid();
                case 2 -> game = new Snake();
            }
            System.out.println("Выберите:");
            System.out.println("1 - играть ещё");
            System.out.println("0 - выход");
            if (vyborIgry.hasNextInt()) choice = vyborIgry.nextInt();
            if (choice == 1) newGame = true;
        }


    }
}