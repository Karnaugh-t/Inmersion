


class Fourier {
  float alpha;
  float band;
  int logoResize = 500;
  float eRadius;

  Fourier() {
    minim = new Minim(this);
    in = minim.getLineIn();
    fft = new FFT( in.bufferSize(), in.sampleRate() );
    beat = new BeatDetect();
    eRadius = 20;
  }

  void DrawSpectrum(float vColor,float intensity , float variacion) {
    fft.forward( in.mix );
    background(0);
    for (int i = 0; i < fft.specSize(); i++)
    {
      if (i > 0 && i <= 120) {          
        stroke(vColor, 24, 100);
      } else if(i >= 121 && i < 220){
        stroke(vColor, 82, 35);
      }else if(i >= 220 && i < 340){
        stroke(80,vColor , 0);
      }else {
        stroke(30, 15, vColor);
      }
      line( i * 3, height, i * 3, height - fft.getBand(i)*intensity);
    }
  }

  void DrawArcs(float vColor, float intensity, float variacion) {
    float arcSize = 150;
    float yStep = 10;
    float sw;
    variacion = map (variacion,1,40,150,300);
    vColor = vColor / 2;
    fft.forward( in.mix );
    background(#eeeeee);
    noFill();
    stroke(vColor,vColor*0.55,vColor *1.5);
    for (int y = 0; y < height; y+=yStep) {
      sw = map(sin(radians(y + alpha)), -1, 1, 2, yStep);
      strokeWeight(sw);
      for (int x = 0; x < width + arcSize; x+=arcSize) {
        arc(x, y, arcSize /2, arcSize + (fft.getBand(y)*3)/ 2, 0, PI);
        arc(x + arcSize / 2, y, variacion/ 2, arcSize+ (fft.getBand(y) * 15) / 2, PI, TWO_PI);
      }
    }
    alpha+=intensity / 2;
  }

  void DrawLights(float vColor, float intensity, float variacion) {
    
    background(0);
    beat.detect(in.mix);
    float a = map(eRadius, 20, 80, 60, 255);
    fill(vColor, 136, vColor, a);
    if ( beat.isOnset() ) 
    {
      fill(vColor, 255, vColor, a);
      eRadius = intensity;
    }

    for (int x = 10; x< width; x+=60) {
      for (int y = 28; y< height; y+=60) {
        noStroke();
        ellipse(x, y, eRadius, variacion);
      }
    }

    eRadius *= 0.95;

    if ( eRadius < 20 ) {
      eRadius = 20;
    }
  }

  void DrawLogo(float vColor, float intensity, float variacion) {
    imageMode(CENTER);
    background(0);
    logo.resize(0, logoResize);
    beat.detect(in.mix);
    image(logo, width / 2, height / 2);
    if (beat.isOnset()) {
      logoResize = int(lerp(logoResize, 600, 0.3));
    } else {
      logoResize = int(lerp(logoResize, 500, 0.7));
    }
  }
}
