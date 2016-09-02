/*Hello. Below is a program, google_challenge, that takes in a string and will return a string 
 with the correct spaces between each word so that the string reads like a sentence.
 For example, running google_challenge IAMADOG, will output I AM A DOG 
 
I have commented out some lines that were used for testing and developing. Please feel free to uncomment them to see exactly 
how the program is working. 

Code by Franchesca Pe–a*/


import java.util.*;
public class google_challenge {
    
    static String string1 = "";
    static String string2 = "";
    static String string3 = "";
    static String test2 = "";
    static String test3 = "";
    static List<String> dict = Arrays.asList("MY", "FAVOR", "GOOGLE", "CAFE", "DOG", "RAIN","HEMISPHERES", "THE", "I",
                                             "SCHOOL", "CODING", "IS", "UNIVERSITY", "OPEN", "TODAY", "HELLO", "FRANCHESCA",
                                             "BEST", "FOOD", "LIKE", "A", "LOT", "SHE", "DOGS", "BLUE", "FAVORITE", "ATE","DOG", "AM");
    static int j;
    static String finalString;
    
    public static void main(String[] args) {
        finalString= "";
        addSpaces(args[0], dict);
        System.out.println(finalString);
    }
    
    static String addSpaces (String sentence, List<String> wordList) {
        int k=0;
        for(int i=1; i<sentence.length()+1;i++){
            string1 = sentence.substring(k,i);
            //System.out.println("string1 is: " + string1);
            if ((wordList.contains(string1)) && (test2(sentence.substring(i),wordList))){
                finalString=finalString.concat(string1).concat(" "); 
                //System.out.println("FinalString is: " + finalString);
                addSpaces(sentence.substring(i), wordList);
            }
        }
        return finalString;
    }
    
    static boolean test2 (String string2, List<String> wordList) {
        if (string2.equals("") || string2.equals(null)) return true; 
        int k=0;
        for(int i=1; i<string2.length()+1;i++){
            test2 = string2.substring(k,i);
           // System.out.println("test2 is: " + test2);
            if (wordList.contains(test2)){
                if(test3(string2.substring(i), wordList)){
                    //System.out.println("true2");
                    return true;
                }
            }
        }
       // System.out.println("false2");
        return false;
    }
    
    static boolean test3 (String string3, List<String> wordList){
        if (string3.equals("") || string3.equals(null)) return true; 
        int k=0;
        for(int i=1; i<string3.length()+1;i++){
            test3 = string3.substring(k,i);
            //System.out.println("test3 is: " + test3);
            if (wordList.contains(test3)){
                //System.out.println("true3");
                return true;
            }
        }
        //System.out.println("false3");
        return false;
    }
    
}



