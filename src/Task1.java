import java.util.Scanner;

public class Task1 {
    public static void main(String[] args) {
        Scanner vyborIgry = new Scanner(System.in);
        boolean newGame = true;

        while (newGame) {
            newGame = false;
            System.out.println("Выберите:");
            System.out.println("1 - Пирамида");
            System.out.println("2 - Змейка");
            System.out.println();
            System.out.println("0 - Выход");
            int choice = 0;
            if (vyborIgry.hasNextInt()) choice = vyborIgry.nextInt();
            Game game = null;
            switch (choice) {
                case 0 -> System.exit(0);
                case 1 -> game = new Piramid();
                case 2 -> game = new Snake();
                default -> System.out.println("неверный ввод");
            }
            if (game != null) game.play();
            System.out.println("Выберите:");
            System.out.println("1 - играть ещё");
            System.out.println("любой другой ввод - выход");
            if (vyborIgry.hasNextInt()) choice = vyborIgry.nextInt();
            if (choice == 1) newGame = true;
        }


    }
}