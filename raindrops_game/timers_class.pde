class timers
{
  int old;

  timers()
  {
    old = 0;
  }

  boolean count()
  {
    boolean t = false;
    if (millis() - old >= 500)  //this is when it'll do something
    {
      //reset the counter to 0
      old = millis();
      //make the if statement run in the main code
      t = true;
    }
    return t;
  }
}
