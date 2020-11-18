


class Fourier {
  float alpha;
  float band;
  int test = 500;
  float eRadius;

  Fourier() {
    minim = new Minim(this);
    in = minim.getLineIn();
    fft = new FFT( in.bufferSize(), in.sampleRate() );
    beat = new BeatDetect();
    eRadius = 20;
  }

  void DrawSpectrum(float intensity, float vColor, float variacion) {
    fft.forward( in.mix );
    background(0);
    for (int i = 0; i < fft.specSize(); i++)
    {
      if (i > 0 && i < 120) {
        stroke(255, 0, 255);
      } else {
        stroke(0, 0, 255);
      }
      line( i * 3, height, i * 3, height - fft.getBand(i)*15);
    }
  }

  void DrawArcs(float intensity, float vColor, float variacion) {
    float arcSize = 150;
    float yStep = 10;
    float sw;

    fft.forward( in.mix );
    background(#eeeeee);
    noFill();
    stroke(20);
    for (int y = 0; y < height; y+=yStep) {
      sw = map(sin(radians(y + alpha)), -1, 1, 2, yStep);
      strokeWeight(sw);
      for (int x = 0; x < width + arcSize; x+=arcSize) {
        arc(x, y, arcSize /2, arcSize + (fft.getBand(y)*3)/ 2, 0, PI);
        arc(x + arcSize / 2, y, arcSize/ 2, arcSize+ (fft.getBand(y) * 15) / 2, PI, TWO_PI);
      }
    }
    alpha+=intensity;
  }

  void DrawLights(float intensity, float vColor, float variacion) {
    background(0);
    beat.detect(in.mix);
    float a = map(eRadius, 20, 80, 60, 255);
    fill(60, 255, 0, a);
    if ( beat.isOnset() ) 
    {
      fill(255, 255, 0, a);
      eRadius = 45;
    }

    for (int x = 10; x< width; x+=60) {
      for (int y = 28; y< height; y+=60) {
        noStroke();
        ellipse(x, y, eRadius, eRadius);
      }
    }

    eRadius *= 0.95;

    if ( eRadius < 20 ) {
      eRadius = 20;
    }
  }

  void DrawLogo(float intensity, float vColor, float variacion) {
    imageMode(CENTER);
    logo.resize(0, test);
    background(0);
    beat.detect(in.mix);

    image(logo, width / 2, height / 2);

    if (beat.isOnset()) {
      test = int(lerp(test, 600, 0.3));
    } else {
      test = int(lerp(test, 500, 0.7));
    }
    println(test);
  }
}
