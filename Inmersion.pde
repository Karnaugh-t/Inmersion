import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;

import java.awt.Font;

GUI_Elements[] knob = new GUI_Elements[3];
GUI_Elements text = new GUI_Elements(this);

Fourier fourier = new Fourier();
BeatDetector beatDetect;

String visual  = "freq";

int bgcol = 22;

Float vColor = 0f;
Float intensity = 0f;
Float variation = 0f;


public void settings() { 
  size(1280, 720, P3D);

  String[] args = {"GUI"};
  GUI sa = new GUI();
  PApplet.runSketch(args, sa);
  
  beatDetect = new BeatDetector();
  
}

void draw() {
  //float x1 = map(knob[0].getKnobValue(), 0, 1, 0, 255);
  stroke(255);
  //fourier.DrawArcs();
  beatDetect.returnBeat();
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
    textAlign(CENTER);
    textSize(24);
    //text.createText(intensity,"Intensidad",600,500);
    //text.createText(variation,"Variación",1000,500);
  }


  public void Elements() {
    //Knobs

    for (int i = 0; i < knob.length; i++) {
      knob[i].CreateKnob((i*420)+ 70, 50, 300, 300);
    }

    //Buttons
    //bt1 = new GButton(this, 70, 520, 120, 120, "1");
    //bt1.setFont(new Font("Arial", Font.BOLD, 40));
  }

  public void handleKnobEvents(GValueControl knobs, GEvent event) {
    if (event == GEvent.VALUE_STEADY) {
      vColor = knob[0].getKnobValue();
    } else if (event == GEvent.VALUE_STEADY) {
      intensity = knob[1].getKnobValue();
    } else if (event == GEvent.VALUE_STEADY) {
      variation = knob[2].getKnobValue();
    }
  }

  //public void handleButtonEvents(GButton button, GEvent event) {
  //  if (button == bt1 && event == GEvent.CLICKED) {
  //  }
  //}

  void keyPressed() {
    if (key == 'm') {
      visual = "freq";
    } else {
      visual = "eo";
    }
  }
}
