class Tile
{
  float pos[] = new float[2];
  int index[] = new int[2];
  float size[] = new float[2];
  int state;

  Tile(int x, int y, float w, float h, int s)
  {
    index[0] = x; index[1] = y;
    size[0] = w; size[1] = h;
    pos[0] = x*w; pos[1] = y*h;
    state = s;
  }

  public void display()
  {
    switch(state)
    {
    case 0:
      fill(0);
      break;

    case 1:
      fill(255);
      break;

    case 2:
      fill(255, 0, 0);
      break;

    case 3:
      fill(0, 255, 0);
      break;
    }

    rect(pos[0], pos[1], size[0], size[1]);
  }
  
  int getState() {return state;}
  void setState(int s) {state = s;}
  
  float[] getSize() {return size;}
}