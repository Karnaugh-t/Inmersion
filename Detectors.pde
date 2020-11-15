

BeatDetect beat;

float eRadius;

class Detectors {

  Detectors()
  {
    beat = new BeatDetect();
    eRadius = 20;
  }

  void BeatDetector()
  {
    background(0);
    beat.detect(in.mix);
    float a = map(eRadius, 20, 80, 60, 255);
    fill(60, 255, 0, a);
    
    if ( beat.isOnset() ) 
    {
      eRadius = 80;
    }
    ellipse(width/2, height/2, eRadius, eRadius);
    
    eRadius *= 0.95;
    
    
    if ( eRadius < 20 ) 
      eRadius = 20;
    
  }
}
