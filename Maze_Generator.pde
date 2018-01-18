Player player; 

int maxLevel = 9;

Maze maze[] = new Maze[maxLevel+1];

int size[][] = new int[maxLevel+1][2];

int level = 0;

void setup()
{
  fullScreen(P2D);

  for (int i = 0; i < size.length; i++)
  {
    for (int j = 0; j < size[i].length; j++)
    {
      size[i][j] = (i+10)*10+1;
    }

    maze[i] = new Maze(size[i]);
  }

  player = new Player(maze[level].start[0], maze[level].start[1], color(0, 128, 255, 50));

  noStroke();
}

void draw()
{
  background(0);

  maze[level].update();
  maze[level].display();

  player.display(maze[level].tiles[player.index[0]][player.index[1]]);

  if (level <= maxLevel) 
  {
    if (player.index[0] == maze[level].end[0] && player.index[1] == maze[level].end[1]) 
    {
      restart();
    }
  }


  if (keyPressed)
  {
    if (key == CODED)
    {
      if (maze[level].playable)
      {
        if (keyCode == UP)
        {
          if (player.moveValid(maze[level], 2)) player.index[1]--;
        }

        if (keyCode == DOWN)
        {
          if (player.moveValid(maze[level], 3)) player.index[1]++;
        }

        if (keyCode == LEFT)
        {
          if (player.moveValid(maze[level], 0)) player.index[0]--;
        }

        if (keyCode == RIGHT)
        {
          if (player.moveValid(maze[level], 1)) player.index[0]++;
        }
      }
    }
  }
}


boolean allFalse(boolean b[])
{
  boolean allFalse = true;

  for (int i = 0; i < b.length; i++)
  {
    if (b[i] == true)
    {
      allFalse = false;
      break;
    }
  }

  return allFalse;
}

void restart()
{
  background(0);

  level++;
  player.index[0] = maze[level].start[0];
  player.index[1] = maze[level].start[1];
  maze[level].setGenerated(false);
  maze[level].setPlayable(false);
}