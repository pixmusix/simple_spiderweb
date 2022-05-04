int CanvasSz = 1000;
Network net;
PFont fonttype;

int loop;

void settings() {
  size(CanvasSz, CanvasSz);
}

void setup() {
  loop = 0;
  fonttype = createFont("Arial",16,true);
  frameRate(10);
}

void draw() {
  clear();
  loop = loop + 1;
  
  int nd = loop;
  int ru = 450;
  int ml = 2;
  int dp = loop;
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
