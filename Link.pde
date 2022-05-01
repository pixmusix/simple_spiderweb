class Link {
  Node vertexA;
  Node vertexB;
  
  Link(Node a, Node b) {
    vertexA = a;
    vertexB = b;
  }
  
  void make() {
    strokeWeight(1);
    line(vertexA.loc.x, vertexA.loc.y, vertexB.loc.x, vertexB.loc.y);
  }
}
