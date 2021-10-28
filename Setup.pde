void setupScenes() {
  frames.add(new Frame("room/window.jpg"));
  frames.add(new Frame("room/bed.jpg"));
  frames.add(new Frame("room/door.jpg"));
  frames.add(new Frame("room/chair.jpg"));
  
  // janela 0
  frames.add(new Frame("room/window_close.jpg"));
  // porta 2
  frames.add(new Frame("room/tv.jpg"));
  // chair 3
  frames.add(new Frame("room/chair_close.jpg"));
  frames.add(new Frame("room/bookshelf.jpg"));
  
  
}

void setupHotspots() {
  // janela ----------------------------------
  Frame c0 = frames.get(0);

  c0.addHotspot(1167, 15, 1280, 650, 1);
  c0.addHotspot(0, 15, 140, 650, 3);
  
  c0.addHotspot(420, 93, 872, 315, 4);

  // cama -----------------------------------
  Frame c1 = frames.get(1);

  c1.addHotspot(1167, 15, 1280, 650, 2);
  c1.addHotspot(0, 15, 140, 650, 0);
  
  // porta -----------------------------------
  Frame c2 = frames.get(2);
  
  c2.addHotspot(1167, 15, 1280, 650, 3);
  c2.addHotspot(0, 15, 140, 650, 1);
  
  c2.addHotspot(560, 230, 1030, 540, 5);
  
  // cadeira -----------------------------------
  Frame c3 = frames.get(3);

  c3.addHotspot(1167, 15, 1280, 650, 0);
  c3.addHotspot(0, 15, 140, 650, 2);
  
  c3.addHotspot(320, 400, 580, 656, 6);
  c3.addHotspot(670, 195, 1150, 615, 7);
  
  // janela perto ----------------------------------
  Frame c4 = frames.get(4);
  
  c4.addHotspot(140, 580, 1175, 680, 0);
  
  // tv ----------------------------------
  Frame c5 = frames.get(5);
  
  c5.addHotspot(140, 580, 1175, 680, 2);
  
  // cadeira perto ----------------------------------
  Frame c6 = frames.get(6);
  
  c6.addHotspot(140, 580, 1175, 680, 3);
  
  // estante ----------------------------------
  Frame c7 = frames.get(7);
  
  c7.addHotspot(140, 580, 1175, 680, 3);
  
}

void saveState() {
  JSONArray state = new JSONArray();
  
  for (int i = 0; i < frames.size(); i++) {
    JSONArray hotspots = new JSONArray();
    JSONObject frame = new JSONObject();

    frame.setInt("id", i);
    frame.setString("frameImg", frames.get(i).frameImgRef);
    
    
    for (int h = 0; h < frames.get(i).hotspots.size(); h++) {
      JSONObject hotspot = new JSONObject();
      JSONArray vertices = new JSONArray();
      
      Hotspot current = frames.get(i).hotspots.get(h);
      
      hotspot.setInt("id", h);
      hotspot.setInt("target", current.targetFrameIndex);
      
      for (int v = 0; v < current.vertices.length; v++) {
        JSONObject vertex = new JSONObject();
        
        vertex.setFloat("x", current.vertices[v].x);
        vertex.setFloat("y", current.vertices[v].y);
        
        vertices.setJSONObject(v, vertex);
      }
      
      hotspot.setJSONArray("vertices", vertices);
      
      hotspots.setJSONObject(h, hotspot);
    }
    
    
    frame.setJSONArray("hotspots", hotspots);

    state.setJSONObject(i, frame);
  }
  
  saveJSONArray(state, "data/adventure.json");
}
