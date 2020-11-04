import java.awt.Font;
GUI_Elements[] knob = new GUI_Elements[3];

int bgcol = 22;

String value1 = "";
String value2 = "";
String value3 = "";


public void settings() { 
  size(1280, 720);
  String[] args = {"GUI"};
  GUI sa = new GUI();
  PApplet.runSketch(args, sa);
}

void draw() {
  background(0);
  text(value1, 635, 605);
  text(value2, 635, 625);
  text(value3, 635, 645);
} 

public class GUI extends PApplet {
  public void settings() {
    size(1280, 720);
  }

  void setup() {
    G4P.setCursor(CROSS);


    knob[0] = new GUI_Elements(this);
    knob[1] = new GUI_Elements(this);
    knob[2] = new GUI_Elements(this);
    Elements();
  }

  void draw() {
    background(bgcol);
    value1 = knob[0].getKnobValue();
    value2 = knob[1].getKnobValue();
    value3 = knob[2].getKnobValue();
  }

  //public void handleButtonEvents(GButton button, GEvent event) {
  //  if (button == bt1 && event == GEvent.CLICKED) {
  //  }
  //}

  public void Elements() {
    //Knobs
    knob[0].CreateKnob(200, 200, 200, 200);
    knob[1].CreateKnob(600, 200, 200, 200);
    knob[2].CreateKnob(1000, 200, 200, 200);

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
