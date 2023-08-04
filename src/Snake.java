import java.util.Scanner;

public class Snake {
    static int[] [] table;
    static int razmernost;
    static int count = 1;
    Snake(){
        main(new String[]{""});
    }
    private static void slevaNapravo(int tekushchajaStroka,int tekushchijStolbec){
        for (int stolbec = tekushchijStolbec; stolbec < (razmernost-tekushchijStolbec-1);stolbec++){
            table[tekushchajaStroka][stolbec] = count;
            count++;
        }
    }
    private static void spravaNalevo(int tekushchajaStroka,int tekushchijStolbec) {
        for (int stolbec = (razmernost - tekushchijStolbec-1); stolbec > tekushchijStolbec; stolbec--) {
            table[tekushchajaStroka][stolbec] = count;
            count++;
        }
    }
    private static void svervuVniz(int tekushchajaStroka,int tekushchijStolbec){
            for (int stroka = tekushchajaStroka; stroka<(razmernost-tekushchajaStroka-1);stroka++){
                table[stroka][tekushchijStolbec] = count;
                count++;
            }
    }
    private static void snizuVverh(int tekushchajaStroka,int tekushchijStolbec){
        for (int stroka = (razmernost-tekushchajaStroka-1); stroka>tekushchajaStroka;stroka--){
            table[stroka][tekushchijStolbec] = count;
            count++;
        }
    }

    public static void main(String[] args) {
        System.out.println("¬ведите желаемую ширину таблицы");
        Scanner scan = new Scanner(System.in);
        razmernost = scan.nextInt();
        table = new int[razmernost][razmernost];
        int maxCount = razmernost*razmernost;
        int stroka=0, stolbec=0;
        while (count < maxCount) {

            slevaNapravo(stroka, stolbec);
            svervuVniz(stroka, (razmernost-stolbec-1));
            spravaNalevo((razmernost-stroka-1), stolbec);
            snizuVverh(stroka, stolbec);
            stroka++;
            stolbec++;

        }
        if (razmernost%2 == 1) table[(razmernost/2)][(razmernost/2)] = maxCount;
        for (int rowIndex=0; rowIndex<razmernost;rowIndex++){
            for (int columnIndex=0; columnIndex<razmernost;columnIndex++){
                System.out.print(table[rowIndex][columnIndex] + " ");
            }
            System.out.println();
        }


    }
}
