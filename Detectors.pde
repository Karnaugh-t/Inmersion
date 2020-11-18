BeatDetect beat;

float eRadius;

class Detectors {

  Detectors()
  {
    beat = new BeatDetect();
    eRadius = 20;
  }

  Detectors(AudioInput in)
  {
    beat = new BeatDetect(in.bufferSize(), in.sampleRate());
    beat.setSensitivity(10); 
  }


  void BeatDetector()
  {
    background(0);
    beat.detect(in.mix); 
  }
  
  boolean KickDetector(){
    boolean kick = beat.isKick() ? true : false;
    return kick;
  }
}
