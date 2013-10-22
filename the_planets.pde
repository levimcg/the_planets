//A scale representation of the planets of our solar system

//Data courtesty of The Center For Science Education
//@ Space Sciences Laboratory, UC Berkeley
//http://cse.ssl.berkeley.edu/AtHomeAstronomy/act10_datasheet.html

//http://www.levimcg.com/the-planets/

import processing.pdf.*; 

color color_group [] = {#1C3747, #EF3A4E, #FF8477, #FFD3CB, #00AAB5};
color palette [] = color_group;
float totalDiameter = 21.12;
int offset = 50;
float spacer = 10;



 void setup(){
  size(1200, 900);
  beginRecord(PDF, "the-planets.pdf");
  smooth();
  background(palette[0]);
  noStroke();
  translate(offset, 0);
  
  //for importing csv files into a 2d array
  //by che-wei wang
  //http://cwwang.com/2008/02/23/csv-import-for-processing/
  
  String lines[] = loadStrings("the-planets.csv");
  String [][] csv;
  int csvWidth=0;

  //calculate max width of csv file
  for (int i=0; i < lines.length; i++) {
    String [] chars=split(lines[i], ',');
    if (chars.length>csvWidth) {
      csvWidth=chars.length;
    }
  }

  //create csv array based on # of rows and columns in csv file
  csv = new String [lines.length][csvWidth];

  //parse values into 2d array
  for (int i=0; i < lines.length; i++) {
    String [] temp = new String [lines.length];
    temp= split(lines[i], ',');
    for (int j=0; j < temp.length; j++) {
      csv[i][j]=temp[j];
    }
  }
  
  // draw the planets
  for (int g = 0; g < csv.length; g++) {
    String planetDiameter_temp = csv[g][1];
    float planetDiameter = map(float(planetDiameter_temp), 0, totalDiameter, 0, width - ( (offset*2) + ( spacer * (csv.length -1) ) ));
    
    // check to see if planet is Earth
    // if it is, make it blue
    if (g == 2) {
      fill(palette[4]);
    } else {  
      fill(palette[1]);
    }
    
    ellipse((planetDiameter/2), height/2, planetDiameter, planetDiameter);
    translate(planetDiameter + spacer  , 0);
    
  }
  
  endRecord();
  
}
