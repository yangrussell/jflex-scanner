package scanner;

import java.io.*;

public class Tester {
    public static void main(String[] args) {
        try {
            Scanner sca = new Scanner(new FileReader(new File("./test.txt")));
            String currTok = sca.nextToken();
            while(currTok!="END") {
                System.out.println(currTok);
                currTok = sca.nextToken();
            }
            System.out.println(currTok);
        }
        catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }
        
    }
}