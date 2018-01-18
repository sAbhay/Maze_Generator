class Player
{
  int index[] = new int[2];
  color c;
  boolean valid[] = new boolean[4];

  Player(int x, int y, color colour)
  {
    index[0] = x; 
    index[1] = y;
    c = colour;
  }

  void display(Tile t)
  { 
    fill(c);
    float size = (t.getSize()[0] < t.getSize()[1]) ? t.getSize()[0] : t.getSize()[1];
    ellipse(t.pos[0] + t.size[0]/2, t.pos[1] + t.size[1]/2, 0.8*size, 0.8*size);
  }

  boolean moveValid(Maze maze, int move) // left, right, up, down
  {
    switch(move)
    {
    case 0:
      if (index[0] > 0)
      {
        if (maze.getTiles()[index[0]-1][index[1]].getState() != 0)
        {
          return true;
        } else return false;
      } else return false;

    case 1:
      if (index[0] < (maze.size[0]-1))
      {
        if (maze.getTiles()[index[0]+1][index[1]].getState() != 0)
        {
          return true;
        } else return false;
      } else return false;

    case 2:
      if (index[1] > 0)
      {
        if (maze.getTiles()[index[0]][index[1]-1].getState() != 0)
        {
          return true;
        } else return false;
      } else return false;

    case 3:
      if (index[1] < (maze.size[1]-1))
      {
        if (maze.getTiles()[index[0]][index[1]+1].getState() != 0)
        {
          return true;
        } else return false;
      } else return false;
      
      default:
        return false;
    }
  }
}