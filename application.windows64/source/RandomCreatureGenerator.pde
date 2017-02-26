String body[];
String skin[], head[], locomotion[], appendages[], attack[], defences[], 
  intelligence[], weird[];
int randomBody, randomSkin, randomHead, randomLocomotion, randomAppendages, randomAttack, randomDefences, randomIntelligence, randomWeird;
public enum Traits {
  BODY,HEAD,LOCOMOTION,APPENDAGES,ATTACK,DEFENCES,INTELLIGENCE,WEIRD
}
ArrayList<String[]> traitList;
int randNum[] = new int[8];
void setup()
{    
  size(800, 400);
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
  printRand();
}
void draw()
{
}
void printRand(){
  PFont f;
  PFont font2;
  font2 = createFont("Arial Bold",16, true);
  f = createFont("Arial", 16, true);
  background(255);
  fill(0);                         // STEP 4 Specify font color 
  for(int i = 0; i<traitList.size();i++)
  {
    int sizeList = traitList.get(i).length;
    int randElem = (int)random(sizeList);
    randNum[i] = randElem;
    textFont(font2, 16);                  // STEP 3 Specify font to be used
    text(Traits.values()[i]+"",0+width/20, height/10+ 30*i);
    textFont(f, 16);                  // STEP 3 Specify font to be used
    text(" "+traitList.get(i)[randElem],0+width/5, height/10+ 30*i);
  }
  text("Press r to refresh",width/20,height-height/20);
}
void reprint()
{ 
  PFont f;
  PFont font2;
  font2 = createFont("Arial Bold",16, true);
  f = createFont("Arial", 16, true);
  background(255);
  textFont(f, 16);                  // STEP 3 Specify font to be used
  fill(0);                         // STEP 4 Specify font color 
  for(int i = 0; i<traitList.size();i++)
  {
    int randElem = randNum[i];
    textFont(font2, 16);                  // STEP 3 Specify font to be used
    text(Traits.values()[i]+"",0+width/20, height/10+ 30*i);
    textFont(f, 16);                  // STEP 3 Specify font to be used
    text(" "+traitList.get(i)[randElem],0+width/5, height/10+ 30*i);
  }
  text("Press r to refresh",width/20,height-height/20);
}

void mouseClicked() {
  for(int i = 0; i<Traits.values().length;i++)
  {
    if(mouseY > height/10 + 30*i -15 && mouseY < height/10 + 30*i +15)
    {
      randNum[i] = (int)random(traitList.get(i).length);
      reprint();
    }
  }
}
void keyReleased() {
  if (key == 'r') {
    printRand();
  } else {
  }
  for(int i = 0; i<Traits.values().length;i++)
  {
    String id = Integer.toString(i);
    if(key == id.charAt(0))
    {
      randNum[i] = (int)random(traitList.get(i).length);
      reprint();
    }
  }
}