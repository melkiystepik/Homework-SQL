import java.util.Scanner;

public class Snake implements Game {
    static int[] [] table;
    static int razmernost;
    static int count = 1;
/*для заполнения массива таблицы я решил выбрать отдельные методы на каждом направлении: слева-направо, сверху-вниз,
* справа-налево, снизу вверх. Они выполняются друг за другом и так заполняют таблицу по спирали
*/
    private static void slevaNapravo(int tekushchajaStroka,int tekushchijStolbec) {
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
    private static void svervuVniz(int tekushchajaStroka,int tekushchijStolbec) {
            for (int stroka = tekushchajaStroka; stroka<(razmernost-tekushchajaStroka-1);stroka++){
                table[stroka][tekushchijStolbec] = count;
                count++;
            }
    }
    private static void snizuVverh(int tekushchajaStroka,int tekushchijStolbec) {
        for (int stroka = (razmernost-tekushchajaStroka-1); stroka>tekushchajaStroka;stroka--){
            table[stroka][tekushchijStolbec] = count;
            count++;
        }
    }

    public void play() {
        System.out.println("Введите желаемую ширину таблицы");
        Scanner scan = new Scanner(System.in);
        razmernost = scan.nextInt();
        if (razmernost > 20) {
            System.out.println("надо было не больше 20 число воодить");
            System.exit(0);
        }
        table = new int[razmernost][razmernost];
        int maxCount = razmernost*razmernost;
        int stroka=0, stolbec=0;
//сначала весь массив таблицы заполняется
        while (count < maxCount) {

            slevaNapravo(stroka, stolbec);
            svervuVniz(stroka, (razmernost-stolbec-1));
            spravaNalevo((razmernost-stroka-1), stolbec);
            snizuVverh(stroka, stolbec);
            stroka++;
            stolbec++;

        }
        if (razmernost % 2 == 1) table[(razmernost / 2)][(razmernost / 2)] = maxCount; //а это походу костыль для нечётной длины ребра таблицы(((

//а потом выводится
        for (int rowIndex = 0; rowIndex < razmernost; rowIndex++) {
            for (int columnIndex = 0; columnIndex < razmernost; columnIndex++) {
                System.out.print(String.format("%03d ", table[rowIndex][columnIndex]));
            }
            System.out.println();
        }


    }
}
