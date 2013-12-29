class timers
{
  int old;

  timers()
  {
    old = 0;
  }

  boolean count()
  {
    //set t to false if the time hasn't passed yet
    boolean t = false;
    //this is when it'll do something
    if (millis() - old >= 500)
    {
      //reset the counter to 0
      old = millis();
      //set t to true because the right amount of time has passed
      t = true;
    }
    //make the if statement run
    return t;
  }
}
