class Frame {
  PImage frameImg = createImage(0, 0, RGB);
  Hotspot selectedHotspot;
  ArrayList<Hotspot> hotspots = new ArrayList<Hotspot>();  
  Frame(PImage image) {
    frameImg = image;
    frameImg.resize(width, height);
  }
  
  void changeFrame(Hotspot hotspot) {
    currentFrame = hotspot.getTargetIndex();
    selectedHotspot = null;
  }
  
  void addHotspot(float x1, float y1, float x2, float y2, int targetIndex) {
    Hotspot tmp = new Hotspot(x1, y1);
    tmp.updateShape(x2, y2, true);
    tmp.setTargetIndex(targetIndex);
    hotspots.add(tmp);
  }
  
  void hotspotDrawHandler() {
    if (selectedHotspot != null) {
      if (selectedHotspot.drawing)
        selectedHotspot.updateShape(mouseX, mouseY, false);
      else if (selectedHotspot.editing)
        selectedHotspot.editor.editVertice(mouseX, mouseY, false);
      selectedHotspot.drawHotspot();
    }
  
    for (int i = 0; i < hotspots.size(); i++) {
      try { hotspots.get(i).drawHotspot(); }
      catch(NullPointerException e) {  }
    }
  }

  void hotspotMousePressedHandler() {
    if (selectedHotspot != null) {
      for (int j=0; j < 4; j++) {
        if (selectedHotspot.vertices[j].wasClicked(mouseX, mouseY) && editingMode) {
          selectedHotspot.editor.selectedVertice = selectedHotspot.vertices[j];
          selectedHotspot.editing = true;
          break;
        }
      }
    }
  
  
    for (int i = 0; i < hotspots.size(); i++) {
      if (hotspots.get(i) != null)
        if (hotspots.get(i).wasClicked(mouseX, mouseY) && selectedHotspot == null) {
          if (editingMode) {
            hotspots.get(i).selected = true;
            selectedHotspot = hotspots.get(i);
            break;
          } else {
            changeFrame(hotspots.get(i));
            break;
          }
        }
    }
  
    if (editingMode) {
      if (selectedHotspot == null)
        selectedHotspot = new Hotspot(mouseX, mouseY);
      else if (!selectedHotspot.wasClicked(mouseX, mouseY) && !selectedHotspot.editing) {
        selectedHotspot.selected = false;
        selectedHotspot = null;
      }
    }
  }

  void hotspotMouseReleasedHandler() {
    if (selectedHotspot != null)
      if (selectedHotspot.drawing) {
        selectedHotspot.updateShape(mouseX, mouseY, true);
        hotspots.add(selectedHotspot);
        selectedHotspot = null;
      }
      else if (selectedHotspot.editing)
        selectedHotspot.editor.editVertice(mouseX, mouseY, true);
  }
}
