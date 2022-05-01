class Node {
  PVector loc;
  int sz;
  float ID;
  
  Node(float i, float j) {
    loc = new PVector(i, j);
    ID = random(0, 1000);
    sz = 2;
  }
  
  void make() {
    stroke(220);
    circle(loc.x, loc.y, sz);
  }
}
