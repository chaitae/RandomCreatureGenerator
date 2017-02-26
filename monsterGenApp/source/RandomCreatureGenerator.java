import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class RandomCreatureGenerator extends PApplet {

String body[];
String skin[], head[], locomotion[], appendages[], attack[], defences[], 
  intelligence[], weird[];
int randomBody, randomSkin, randomHead, randomLocomotion, randomAppendages, randomAttack, randomDefences, randomIntelligence, randomWeird;
public enum Traits {
  BODY,HEAD,LOCOMOTION,APPENDAGES,ATTACK,DEFENCES,INTELLIGENCE,WEIRD
}
ArrayList<String[]> traitList;
int randNum[];
public void setup()
{    
  
  traitList = new ArrayList<String[]>();
  body = loadStrings("bodyList.txt");
  skin = loadStrings("skinList.txt");
  head = loadStrings("headList.txt");
  locomotion = loadStrings("locomotiveList.txt");
  appendages = loadStrings("appendageList.txt");
  attack = loadStrings("attackList.txt");
  defences = loadStrings("defencesList.txt");
  intelligence = loadStrings("intelligenceList.txt");
  weird = loadStrings("weirdTraitsList.txt");
  traitList.add(body);
  traitList.add(head);
  traitList.add(locomotion);
  traitList.add(appendages);
  traitList.add(attack);
  traitList.add(defences);
  traitList.add(intelligence);
  traitList.add(weird);
  println("body: "+body[(int)random(body.length)]);
  println("skin: "+skin[(int)random(skin.length)]);
  println("head: "+head[(int)random(head.length)]);
  println("locomotion: "+locomotion[(int)random(locomotion.length)]);
  println("appendages: " + appendages[(int)random(appendages.length)]);
  println("attack: "+attack[(int)random(attack.length)]);
  println("defences: "+defences[(int)random(defences.length)]);
  println("intelligence: "+intelligence[(int)random(intelligence.length)]);
  println("weird: "+weird[(int)random(weird.length)]);

  randomBody = (int)(random(body.length));
  randomSkin = (int)random(skin.length);
  randomHead = (int)random(head.length);
  randomLocomotion = (int)random(locomotion.length);
  randomAppendages = (int)random(appendages.length);
  randomAttack = (int)random(attack.length);
  randomDefences = (int)random(defences.length);
  randomIntelligence = (int)random(intelligence.length);
  randomWeird = (int)random(weird.length);
  printStuff();
  //println("there are " + body.length + " lines");
  //for (int i = 0 ; i < body.length; i++) {
  //  println(body[i]);
  //}
}
public void draw()
{
}
public void printStuff(){
  PFont f;
  f = createFont("Arial", 16, true);
  background(255);
  textFont(f, 16);                  // STEP 3 Specify font to be used
  fill(0);                         // STEP 4 Specify font color 
  for(int i = 0; i<traitList.size();i++)
  {
    int sizeList = traitList.get(i).length;
    int randElem = (int)random(sizeList);
    text(Traits.values()[i] + " "+traitList.get(i)[randElem],0+width/20, height/10+ 30*i);
  }
  text("press r to refresh",width/20,height-height/20);
}
public void keyReleased() {
  if (key == 'r') {
    printStuff();
  } else {
  }
}
  public void settings() {  size(800, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "RandomCreatureGenerator" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
