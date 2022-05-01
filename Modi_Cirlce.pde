int CanvasSz = 1000;
Network net;
PFont fonttype;

void settings() {
  size(CanvasSz, CanvasSz);
}

void setup() {
  fonttype = createFont("Arial",16,true);
  frameRate(14);
}

void draw() {
  clear();
  
  int nd = floor(mouseX / 3) + 1;
  int ru = 400;
  int ml = floor(mouseY / 1) + 1;
  int dp = 100;
  int th = 0;
  
  
  textFont(fonttype,16); 
  fill(255);
  text("Nodes: " + str(nd),10,20);
  text("Radis: " + str(ru),10,40);
  text("Multi: " + str(ml),10,60);
  text("Links: " + str(dp),10,80);
  text("Theta: " + str(th),10,100);
  
  /*Network wants 
    int networksize -> Number of nodes in the network
    int Radius -> The radius of the circle in pixels 
    int multiplier -> 'n' where 2ˆn mod p, if 2 is a primitive root of p
    int depth -> Number of connections of 'n' to draw per frame
    int rotation -> radians along a unit circle to place zeroth node
  */
  net = new Network(nd, ru, ml, dp, th);
}
