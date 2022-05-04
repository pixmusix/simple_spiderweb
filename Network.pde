class Network {
  ArrayList<Node> nodes;
  ArrayList<Link> links;
  int radius;
  int multiplier;
  int depth;
  float networksize;
  float rotation;
  PVector canvascentre;
  
  Network(int sz, int rd, int ml, int dp, int th) {
    //Init Vars
    nodes = new ArrayList<Node>();
    links = new ArrayList<Link>();
    radius = rd;
    multiplier = ml ;
    depth = dp;
    networksize = sz;
    rotation = th;
    canvascentre = new PVector(floor(CanvasSz/2), ceil(CanvasSz/2));
    
    //Draw Network
    make();
    drawnodes();
    gengraph(depth);
    drawlinks();
  }

  void make() {
    //Create the network by populating nodes<>
    for (float k = 0; k < networksize; k = k + 1) {
      float theta = (2 * PI * (k / networksize)) + rotation;
      PVector nodepos = pol2car(radius, theta);
      nodepos.add(canvascentre);
      nodes.add(new Node(nodepos.x, nodepos.y));
    }
  }
  
  int gengraph(int mark) {
    //Create connection between the nodes recursively
    int last = mark % nodes.size() ;
    int next = (mark * multiplier) % nodes.size() ;
    links.add(new Link(nodes.get(last), nodes.get(next)));
    if (mark <= 0) {
      return next;
    }
    return gengraph(mark - 1);
  }
  
  int gengraph_continuous(int mark) {
    //Create connection between the nodes recursively
    int next = (mark + multiplier) % nodes.size() ;
    links.add(new Link(nodes.get(mark), nodes.get(next)));
    if (links.size() > depth) {
      return next;
    }
    return gengraph_continuous(next);
  }
  
  void drawnodes() {
    for(int k=0; k < nodes.size(); k++) {
      nodes.get(k).make();
    }
  }
  
  void drawlinks() {
    for(int k=0; k < links.size(); k++) {
      links.get(k).make();
    }
  }
  
  PVector car2pol(float x, float y) {
    float r = sqrt(x*x + y*y );
    float θ = atan(y / x);
    PVector v = new PVector(r,θ);
    return v;
  }
  
  PVector pol2car(float r, float θ) {
    float x = r * cos(θ);
    float y = r * sin(θ);
    PVector v = new PVector(x,y);
    return v;
  }
  
}
