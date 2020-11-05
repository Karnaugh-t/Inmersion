
import java.awt.Font;
GUI_Elements[] knob = new GUI_Elements[3];
GUI_Elements text = new GUI_Elements(this);

int bgcol = 22;

String vColor = "";
String intensity = "";
String variation = "";


public void settings() { 
  size(1280, 720);
  String[] args = {"GUI"};
  GUI sa = new GUI();
  PApplet.runSketch(args, sa);
}

void draw() {
  background(0);
} 

public class GUI extends PApplet {
  public void settings() {
    size(1280, 720);
  }

  void setup() {
    G4P.setCursor(CROSS);

    for (int i = 0; i < knob.length; i++) {
      knob[i] = new GUI_Elements(this);
    }

    Elements();
  }

  void draw() {
    background(bgcol);
    
    vColor = knob[0].getKnobValue();
    intensity = knob[1].getKnobValue();
    variation = knob[2].getKnobValue();


    text(vColor, 635, 605);
    text(intensity, 635, 625);
    text(variation, 635, 645);
  }

  //public void handleButtonEvents(GButton button, GEvent event) {
  //  if (button == bt1 && event == GEvent.CLICKED) {
  //  }
  //}

  public void Elements() {
    //Knobs

    for (int i = 0; i < knob.length; i++) {

      knob[i].CreateKnob((i*420)+ 70, 50, 300, 300);
    }


    //Buttons
    //bt1 = new GButton(this, 70, 520, 120, 120, "1");
    //bt1.setFont(new Font("Arial", Font.BOLD, 40));

    // Now make the configuration controls
  }

  public void handleKnobEvents(GValueControl knob, GEvent event) {

    //if (knob == kb1 && event == GEvent.VALUE_STEADY) {
    //} else if (knob == kb2 && event == GEvent.VALUE_STEADY) {
    //} else if (knob == kb3 && event == GEvent.VALUE_STEADY) {
    //}
  }
}
