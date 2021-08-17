void setupScenes() {
  scenes.add(new Scene(new Frame(loadImage("room/window.jpg"))));
  scenes.get(0).frames.add(new Frame(loadImage("room/bed.jpg")));
  scenes.get(0).frames.add(new Frame(loadImage("room/door.jpg")));
  scenes.get(0).frames.add(new Frame(loadImage("room/chair.jpg")));
  
  // janela 0
  scenes.get(0).frames.add(new Frame(loadImage("room/window_close.jpg")));
  // porta 2
  scenes.get(0).frames.add(new Frame(loadImage("room/tv.jpg")));
  // chair 3
  scenes.get(0).frames.add(new Frame(loadImage("room/chair_close.jpg")));
  scenes.get(0).frames.add(new Frame(loadImage("room/bookshelf.jpg")));
}

void setupHotspots() {
  // janela ----------------------------------
  Frame c0 = scenes.get(0).frames.get(0);

  c0.addHotspot(1167, 15, 1280, 650, 1);
  c0.addHotspot(0, 15, 140, 650, 3);
  
  c0.addHotspot(420, 93, 872, 315, 4);

  // cama -----------------------------------
  Frame c1 = scenes.get(0).frames.get(1);

  c1.addHotspot(1167, 15, 1280, 650, 2);
  c1.addHotspot(0, 15, 140, 650, 0);
  
  // porta -----------------------------------
  Frame c2 = scenes.get(0).frames.get(2);
  
  c2.addHotspot(1167, 15, 1280, 650, 3);
  c2.addHotspot(0, 15, 140, 650, 1);
  
  c2.addHotspot(560, 230, 1030, 540, 5);
  
  // cadeira -----------------------------------
  Frame c3 = scenes.get(0).frames.get(3);

  c3.addHotspot(1167, 15, 1280, 650, 0);
  c3.addHotspot(0, 15, 140, 650, 2);
  
  c3.addHotspot(320, 400, 580, 656, 6);
  c3.addHotspot(670, 195, 1150, 615, 7);
  
  // janela perto ----------------------------------
  Frame c4 = scenes.get(0).frames.get(4);
  
  c4.addHotspot(140, 580, 1175, 680, 0);
  
  // tv ----------------------------------
  Frame c5 = scenes.get(0).frames.get(5);
  
  c5.addHotspot(140, 580, 1175, 680, 2);
  
  // cadeira perto ----------------------------------
  Frame c6 = scenes.get(0).frames.get(6);
  
  c6.addHotspot(140, 580, 1175, 680, 3);
  
  // estante ----------------------------------
  Frame c7 = scenes.get(0).frames.get(7);
  
  c7.addHotspot(140, 580, 1175, 680, 3);
  
}
