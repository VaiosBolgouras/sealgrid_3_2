public class bfs {
    public static void main(String[] args) {
        int min = 0;
        int max = 1;
        int[][] array = new int[5][5];
        int[] trusted_nodes = new int[5];
        int start = 1;
        int goal = 4;

        // fill the array with 0 and 1///////// πρέπει να αλλάξει (if i=j then 0)(filling the first half, also fills the rest)
        for (int i = 0; i < array.length; i++) {
            trusted_nodes[i] = -1;
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
       
        trusted_nodes[0]=start;
        int i = 0;//deixnei ston pinaka trusted poios komvos 8a exetastei 
        int x = 1;//deixnei thn epomenh thesh pou prepei na ginei eggrafh ston pinaka trusted otan vrethei kapoios empistos komvos
        while (int i < trusted_nodes.length && trusted_nodes[i] != -1){
            for (int j = 0; j < array.length; j++){//vlepoume tous assous sth grammh tou komvou pou exetazoume
                if (array[trusted_nodes[i]][j] == 1){
                    if (j == goal){
                        System.out.print("TRUST FOUND");
                        break;
                    }
                    else{
                        //elegxos oti den uparxei hdh o komvos ston pinaka trusted_nodes
                        flag=false;
                        for (int y = 0; y < trusted_nodes.length; j++){
                            if (trusted_nodes[y] == j){
                                flag = true;
                            }
                        }
                        if (flag == false) {   
                            trusted_nodes[x] = j;
                            x++;
                        }
                    }
                    
                }
            }
            i++;
        }
