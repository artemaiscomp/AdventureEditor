ArrayList<Scene> scenes = new ArrayList<Scene>();
int currentScene = 0;
int currentFrame;
boolean editingMode = false;
int tempo; //tempo serve para ver se pelo menos um hotspot está selecionado

void setup() {
  size(1280, 720);
  noStroke();

  setupScenes();
  setupHotspots();
}

void draw() {
  image(scenes.get(0).getCurrentFrame().frameImg, 0, 0);
  scenes.get(currentScene).getCurrentFrame().hotspotDrawHandler();
  mouseCheck(scenes.get(0).getCurrentFrame().hotspots);
}

void keyPressed() {
  switch (keyCode) {
  case 32: // espaço
    editingMode = !editingMode;
    if (scenes.get(0).getCurrentFrame().selectedHotspot != null) {
      scenes.get(0).getCurrentFrame().selectedHotspot.selected = false;
      scenes.get(0).getCurrentFrame().selectedHotspot = null;
    }
    break;
  case 69: //E
    if (scenes.get(0).getCurrentFrame().selectedHotspot != null)
      scenes.get(0).getCurrentFrame().hotspots.remove(scenes.get(0).getCurrentFrame().selectedHotspot);
    break;
  }
}

void mousePressed() {
  scenes.get(currentScene).getCurrentFrame().hotspotMousePressedHandler();
}

void mouseReleased() {
  scenes.get(currentScene).getCurrentFrame().hotspotMouseReleasedHandler();
}
void mouseCheck(ArrayList<Hotspot> a) {
  for (int i=0; i<a.size(); i++) {
    if (mouseX>a.get(i).primaryCornerX && mouseX<a.get(i).secondaryCornerX &&  mouseY>a.get(i).primaryCornerY && mouseY<a.get(i).secondaryCornerY) {
      cursor(CROSS);
      tempo=0;
    } else{
    tempo++;
    } 
    if(tempo==10){
      cursor(ARROW);
    };
  };
}
