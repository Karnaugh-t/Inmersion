

class GUI_Elements {  
  PApplet theApplet;

  GKnob kb;


  GUI_Elements (PApplet theApplet) {
    this.theApplet = theApplet;
  }
  
  Float getKnobValue(){
    return kb.getValueF();
  }
  
  void CreateKnob(int posX, int posY, int sizeX, int sizeY){
    kb = new GKnob (theApplet, posX, posY,sizeX,sizeY, 0.8);
  }

}
