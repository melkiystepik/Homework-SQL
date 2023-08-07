import java.util.Scanner;

public class Piramid implements Game{
    static int razmernost;

    public void play() {

        System.out.println("Введите \"длину основания\" пирамиды (максимум 20)");
        Scanner scan = new Scanner(System.in);
        razmernost = scan.nextInt();
        if (razmernost > 20) {
            System.out.println("надо было не больше 20 число воодить");
            System.exit(0);
        }
        int[] [] table = new int[razmernost][razmernost];
        int maxVysota = (razmernost + 1) / 2;
        int vysota;
        for (int pole = 0;pole < razmernost;pole++){
             for (int zapis = 0; zapis < razmernost;zapis++){
                int minH = Math.min(pole,zapis);
                if (minH < maxVysota) vysota = minH + 1;
                else vysota = razmernost-minH;
                table[pole][zapis] = vysota;
                if ((zapis) >= maxVysota) table[pole][zapis] = table[pole][Math.abs(razmernost - zapis - 1)];
                if ((pole) >= maxVysota) table[pole][zapis] = table[Math.abs(razmernost - pole - 1)][zapis];
                System.out.print(table[pole][zapis]+" ");
                }
            System.out.println();
            }

        }
    }
