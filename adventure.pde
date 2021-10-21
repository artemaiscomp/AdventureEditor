ArrayList<Frame> frames = new ArrayList<Frame>();
int currentFrame;

boolean editingMode = true;

void setup() {
  size(1280, 720);
  noStroke();
  
  setupScenes();
  setupHotspots();
}

void draw() {
  image(frames.get(currentFrame).frameImg, 0, 0);
  frames.get(currentFrame).hotspotDrawHandler();
}

void keyPressed() {
  switch (keyCode) {
    case 32: // espaço
      editingMode = !editingMode;
      if (frames.get(currentFrame).selectedHotspot != null) {
        frames.get(currentFrame).selectedHotspot.selected = false;
        frames.get(currentFrame).selectedHotspot = null;
      }
      break;
     case 69: //E
       if (frames.get(currentFrame).selectedHotspot != null)
         frames.get(currentFrame).hotspots.remove(frames.get(currentFrame).selectedHotspot);
       break;
  }
}

void mousePressed() {
  frames.get(currentFrame).hotspotMousePressedHandler();
}

void mouseReleased() {
  frames.get(currentFrame).hotspotMouseReleasedHandler();
}
