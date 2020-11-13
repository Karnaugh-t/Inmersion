import g4p_controls.*;

class GUI_Elements {  
  PApplet theApplet;

  GKnob kb;
  GButton bt;

  GUI_Elements (PApplet theApplet) {
    this.theApplet = theApplet;
  }
  
  Float getKnobValue(){
    return kb.getValueF();
  }
  
  void CreateKnob(int posX, int posY, int sizeX, int sizeY){
    kb = new GKnob (theApplet, posX, posY,sizeX,sizeY, 0.8);
  }

  void CreateButton(String buttonText) {
    bt.setFont(new Font("Arial", Font.BOLD, 40));
    bt = new GButton(theApplet, 70, 520, 120, 120, buttonText);
  }
  
}
