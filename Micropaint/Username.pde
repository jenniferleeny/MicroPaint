import java.io.*;
import java.io.IOException;

class Username {
  
//read file
  public String readFile() {
    String fileName = "scores.txt";
    String line = null;
    String s = "";
    try {
      FileReader fileReader =new FileReader(fileName);
      BufferedReader bufferedReader = new BufferedReader(fileReader);
      while((line = bufferedReader.readLine()) != null) {
        s += line;
        s += "-";
      }
      bufferedReader.close();
    }
    catch(FileNotFoundException ex) {
      System.out.println(
             "Unable to open file '" +
             fileName + "'");
    }
    catch(IOException ex) {
      System.out.println("Error reading file '" + fileName + "'");
    }
    System.out.println(s);
    return s;  
  }

  public ArrayList<Double> addToScoreBoard(String s) {
     ArrayList<Double> scoreboard = new ArrayList<Double>();
     String[] parts = s.split("-");
     for (int i = 0; i < parts.length; i++) {
       scoreboard.add(Double.parseDouble(parts[i]));
       System.out.println(parts[i]);
       System.out.println(Double.parseDouble(parts[i]));
     }
     return scoreboard;
  }
}
