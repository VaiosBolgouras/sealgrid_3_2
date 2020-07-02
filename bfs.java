public class bfs {
    public static void main(String[] args) {
        int min = 0;
        int max = 1;
        int[][] array = new int[5][5];
        int start = 2;
        int goal = 4;

        // fill the array with 0 and 1
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length; j++) {
                if (i == j)
                    array[i][j] = 1;
                else
                    array[i][j] = (int) (Math.random() * ((max - min) + 1)) + min;
            }
        }

        // print array
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length; j++) {
                System.out.print(array[i][j]);
            }
            System.out.print("\n");
        }

        if (array[start][goal] == 1)
            System.out.println("Node " + goal + "is trusted");
        else {
            int start_line = arrayLine(array, start);
            if (start_line == 0)
                
            boolean flag = false;
            while (flag == false) {
                search(array, start, goal);
            }
        }
    }

    public static int arrayLine(int[][] array, int start) {
        int line = 0;

        for (int j = 0; j < array.length; j++) {
            if (array[start][j] == 1 && start != j)
                line = j;
        }

        return line;
    }

    public static boolean search(int[][] array, int start, int goal) {
        for (int i = start; i < array.length; i++) {
            for (int j = start + 1; j < array.length; j++) {

            }
        }

        return true;
    }
}

// if a[i][j] == 0 then a[j][i]