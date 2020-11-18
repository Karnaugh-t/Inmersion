import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import g4p_controls.*;

BeatDetect beat;
Minim minim;
AudioInput in;
FFT fft;

import java.awt.Font;

PImage logo;

GButton bt1;
GButton bt2;
GButton bt3;
GButton bt4;

GUI_Elements[] knob = new GUI_Elements[3];
GUI_Elements text = new GUI_Elements(this);
GUI_Elements btn = new GUI_Elements(this);

Fourier fourier = new Fourier();

String visual  = "freq";

int bgcol = 22;

int actualVisual = 1;

Float vColor = 1f;
Float intensity = 0f;
Float variation = 0f;


public void settings() { 
  size(1280, 720, P3D);
  String[] args = {"GUI"};
  logo = loadImage("logo.png");
  GUI sa = new GUI();
  PApplet.runSketch(args, sa);
}

void draw() {
  background(0);
  //float x1 = map(knob[0].getKnobValue(), 0, 1, 0, 255);

  switch(actualVisual) {
  case 1:
    fourier.DrawSpectrum(intensity,vColor,variation);
    break;
  case 2:
    fourier.DrawArcs(intensity,vColor,variation);
    break;
  case 3:
    fourier.DrawLights(intensity,vColor,variation);
    break;

  case 4:
    fourier.DrawLogo(intensity,vColor,variation);
    break;
  }
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

    bt1 = new GButton(this, 90, 500, 150, 150);
    bt1.setText("1");
    bt1.setFont(new Font("Arial", Font.BOLD, 30));

    bt2 = new GButton(this, 400, 500, 150, 150, "2");
    bt2.setText("2");
    bt2.setFont(new Font("Arial", Font.BOLD, 30));

    bt3 = new GButton(this, 720, 500, 150, 150);
    bt3.setText("3");
    bt3.setFont(new Font("Arial", Font.BOLD, 30));

    bt4 = new GButton(this, 1030, 500, 150, 150);
    bt4.setText("4");
    bt4.setFont(new Font("Arial", Font.BOLD, 30));
  }

  public void handleKnobEvents(GValueControl knobs, GEvent event) {
    vColor = knob[0].getKnobValue();
    vColor = map(vColor, 0, 1, 1, 5);

    intensity = knob[1].getKnobValue();
    variation = knob[2].getKnobValue();
  }

  public void handleButtonEvents(GButton button, GEvent event) {
    if (button == bt1 && event == GEvent.CLICKED) {
      actualVisual = 1;
    } else if (button == bt2 && event == GEvent.CLICKED) {
      actualVisual = 2;
    } else if (button == bt3 && event == GEvent.CLICKED) {
      actualVisual = 3;
    } else if (button == bt4 && event == GEvent.CLICKED) {
      actualVisual = 4;
    }
  }
}
