class Hotspot {
  HotspotEditor editor;
  int targetFrameIndex = 0;
  
  public int getTargetIndex() { return targetFrameIndex; }
  public void setTargetIndex(int value) { targetFrameIndex = value; }
  
  
  Vertice[] vertices = new Vertice[4];
  
  int index = 0;
  
  boolean drawing = false;
  boolean editing = false;
  boolean selected = false;
  float primaryCornerX;
  float primaryCornerY;
  float secondaryCornerX;
  float secondaryCornerY;
  
  Hotspot(float aX, float aY) {
    primaryCornerX=aX;
    primaryCornerY=aY;
    vertices[0] = new Vertice(primaryCornerX, primaryCornerY);
    drawing = true;
  }
  
  
  void drawHotspot() {
    fill(185, 185, 185, 100);
    if (selected) {
      editor.showNodes();
      fill(125, 0, 0, 100);
    }
    rect(vertices[0].x, vertices[0].y, vertices[2].x - vertices[0].x, vertices[2].y - vertices[0].y);
  }
  
  void updateShape(float bX, float bY, boolean isFinished) {
    secondaryCornerX=bX;
    secondaryCornerY=bY;
    vertices[2] = new Vertice(secondaryCornerX, secondaryCornerY);
    
    if (isFinished) {
      drawing = false;
      
      if (abs(secondaryCornerX - vertices[0].x) * abs(secondaryCornerY - vertices[0].y) < 625) {
        vertices[2].x = vertices[0].x + 25;
        vertices[2].y = vertices[0].y + 25;
      }
      
      updateVertices();
      editor = new HotspotEditor(this);
    }
  }
  
  void updateVertices() {
    if (vertices[2].x < vertices[0].x) {
      float tmp;
      
      tmp = vertices[2].x;
      vertices[2].x = vertices[0].x;
      vertices[0].x = tmp;
    }
    
    if (vertices[2].y < vertices[0].y) {
      float tmp;
      
      tmp = vertices[2].y;
      vertices[2].y = vertices[0].y;
      vertices[0].y = tmp;
    }
    
    
    vertices[1] = new Vertice(vertices[0].x + (vertices[2].x - vertices[0].x), vertices[0].y);
    vertices[3] = new Vertice(vertices[0].x, vertices[0].y + (vertices[2].y - vertices[0].y));
  }
  
  boolean wasClicked(float clickX, float clickY) {
    boolean click = false;
    
    if (clickX >= vertices[0].x && clickX <= vertices[2].x)
      if (clickY >= vertices[0].y && clickY <= vertices[2].y)
        click = true;
    
    return click;
  }

}



class HotspotEditor {
  Hotspot hotspot;
  Vertice selectedVertice;
  
  HotspotEditor(Hotspot h) {
    hotspot = h;
  }
  
  void showNodes() {
      for (int i = 0; i < 4; i++) {
        fill(125, 0, 0, 100);
        ellipse(hotspot.vertices[i].x, hotspot.vertices[i].y, hotspot.vertices[i].radius, hotspot.vertices[i].radius);
        fill(0);
        text(hotspot.vertices[i].x+", "+ hotspot.vertices[i].y, hotspot.vertices[i].x, hotspot.vertices[i].y);
      }
        
  }
  
  void editVertice(float x, float y, boolean isFinished) {
      selectedVertice.x = x;
      selectedVertice.y = y;
      
      int index = 0;
        
      for (int i = 0; i < 4; i++) {
        if (hotspot.vertices[i] == selectedVertice) {
          index = i;
          break;
        }
      }
      
      if (index % 2 == 0) {
        if (selectedVertice.y != hotspot.vertices[(index + 1) % hotspot.vertices.length].y)
          hotspot.vertices[(index + 1) % hotspot.vertices.length].y = selectedVertice.y;
        if (selectedVertice.x != hotspot.vertices[abs(hotspot.vertices.length - index - 1)].x)
          hotspot.vertices[abs(hotspot.vertices.length - index - 1)].x = selectedVertice.x;
      } else {
        if (selectedVertice.x != hotspot.vertices[(index + 1) % hotspot.vertices.length].x)
          hotspot.vertices[(index + 1) % hotspot.vertices.length].x = selectedVertice.x;
        if (selectedVertice.y != hotspot.vertices[abs((index - 1) % hotspot.vertices.length)].y)
          hotspot.vertices[abs((index - 1) % hotspot.vertices.length)].y = selectedVertice.y;
      }
      
      
      if (isFinished) {
        hotspot.editing = false;
        selectedVertice = null;
        hotspot.updateVertices();
      }
      

  }
}



class Vertice {
  float x;
  float y;
  float radius = 20;
  
  Vertice(float xPos, float yPos) {
    x = xPos;
    y = yPos;
  }
  
  boolean wasClicked(float clickX, float clickY) {
    if (abs(dist(x, y, clickX, clickY)) < radius)
      return true;
    
    return false;
  }

}
