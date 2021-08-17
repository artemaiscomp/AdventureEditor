class Scene {
  ArrayList<Frame> frames = new ArrayList<Frame>();
  
  Scene(Frame initialFrame) {
    frames.add(initialFrame);
  }
  
  Frame getCurrentFrame() {
    return frames.get(currentFrame);
  }
}
