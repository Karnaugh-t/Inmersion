import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;

class Fourier {
  float alpha;
  boolean oelo = false;
  
  Fourier() {
    minim = new Minim(this);
    in = minim.getLineIn();
    fft = new FFT( in.bufferSize(), in.sampleRate() );
  }

  void DrawSpectrum() {
    fft.forward( in.mix );
    background(0);
    for (int i = 0; i < fft.specSize(); i++)
    {
      line( i, height, i, height - fft.getBand(i)*10);
    }
  }

  void DrawArcs() {
    float arcSize = 200;
    float yStep = 10;
    float sw;

    fft.forward( in.mix );
    background(#eeeeee);
    noFill();
    stroke(20);
    strokeWeight(5);


    for (int y = 0; y < height; y+=yStep) {
      sw = map(sin(radians(y + alpha)), -1, 1, 2, yStep);
      strokeWeight(sw);
      for (int x = 0; x < width + arcSize; x+=arcSize) {
        arc(x, y, arcSize / 2, arcSize / 2, 0, PI);
        arc(x + arcSize / 2, y, arcSize / 2, arcSize / 2, PI, TWO_PI);
      }
    }
    alpha+=5;
  }
}
