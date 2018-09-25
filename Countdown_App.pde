Button but, but2;
SelectionButton am, pm;
TextBox eventName;
NumTextBox year, month, day, hour, minute;
TextBox[] boxes;
Button[] buttons;
ArrayList<Time> al;
boolean errMsg;
PImage img;

// run once at beginning
void setup() {
  img = loadImage("fireworks.gif");
  size(500, 700);
  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  textSize(20);
  // settings
  al = new ArrayList<Time>(); 
  errMsg = false;
  
  buttons = new Button[4];
  buttons[0] = but = new Button(250, 100, 140, 50, "New Event");
  buttons[1] = but2 = new Button(250, 350, 140, 50, "Add Event");
  buttons[2] = am = new SelectionButton(375, 250, 50, 50, "AM");
  buttons[3] = pm = new SelectionButton(425, 250, 50, 50, "PM");
  
  boxes = new TextBox[6];
  boxes[0] = eventName = new TextBox(250, 50, 300, 50, "Event Name");
  boxes[1] = year = new NumTextBox(100, 150, 100, 50, year(), "Year");
  boxes[2] = month = new NumTextBox(250, 150, 100, 50, month(), "Month");
  boxes[3] = day = new NumTextBox(400, 150, 100, 50, day(), "Day");
  boxes[4] = hour = new NumTextBox(100, 250, 100, 50, hour() % 12, "Hour");
  boxes[5] = minute = new NumTextBox(250, 250, 100, 50, minute(), "Minute");
  // new objects
  
  but2.setVisib(false);
  am.setVisib(false);
  pm.setVisib(false);
  if (hour() / 12 == 0) {
    am.setSelected(true);
  } else {
    pm.setSelected(true);
  }
  ((NumTextBox)boxes[1]).isYear();
  for (TextBox txt : boxes) {
    txt.setVisib(false);
  }
}

// run over and over again, always
void draw() {
  background(#980000);
  fill(255);
  textSize(30);
  text("Countdown", 250, 50);
  textSize(20);
  int location = 100;
  if (but.getVisib()) {
    for (Time time : al) {
      time.subtraction();
      if (!time.getPassed()) {
        //text(time.getYearsLeft() + " years, " + time.getMonthsLeft() + " months, " + time.getDaysLeft() + " days,\n" + 
        //time.getHoursLeft() + " hours, " + time.getMinutesLeft() + " minutes, " + time.getSecondsLeft() + " seconds,\n" +
        //time.getMillisLeft() + " milliseconds until " + time.getEventName(), 250, location);
        String str = "";
        boolean start = false;
        int x = 0;
        if (time.getYearsLeft() > 0) {
          str += time.getYearsLeft() + " years, ";
          start = true;
          x++;
        }
        if (time.getMonthsLeft() > 0 || start) {
          str += time.getMonthsLeft() + " months, ";
          start = true;
          x++;
        }
        if (time.getDaysLeft() > 0 || start) {
          str += time.getDaysLeft() + " days, ";
          start = true;
          x++;
          if (x % 3 == 0) str += "\n";
        }
        if (time.getHoursLeft() > 0 || start) { 
          str += time.getHoursLeft() + " hours, ";
          start = true;
          x++;
          if (x % 3 == 0) str += "\n";
        }
        if (time.getMinutesLeft() > 0 || start) {
          str += time.getMinutesLeft() + " minutes, ";
          start = true;
          x++;
          if (x % 3 == 0) str += "\n";
        }
        if (time.getSecondsLeft() > 0 || start) {
          str += time.getSecondsLeft() + " seconds, ";
          start = true;
          x++;
          if (x % 3 == 0) str += "\n";
        }
        //if (time.getMillisLeft() > 0 || start) {
          str += time.getMillisLeft() + " milliseconds ";
          start = true;
          x++;
          if (x % 3 != 1) 
          str += "\n";
        //}
        str += "until " + time.getEventName();
        text(str, 250, location);
      } else {
        text(time.getEventName() + " has taken place", 250, location);
        for (int i = 50; i <= 450; i += 100) {
          image(img, i, location + 50, 80, 80);
        }
      }
      
      //text(year() + " years, " + month() + " months, " + day() + " days,\n" + 
      //hour() + " hours, " + minute() + " minutes, " + second() + " seconds,\n" +
      //millis() + " milliseconds until " + time.getEventName(), 250, location);
      location += 120;
    }
    but.setY(location);
  }
  for (Button button : buttons) {
    button.drawShape(); //<>//
  }
  for (TextBox txt : boxes) {
    txt.drawShape();
  }
  if (errMsg) {
        fill(255);
        text("Error: Invalid Input Entered", 250, 450);
  }
  // draw all the objects
}

// run each time mouse button is released
void mouseReleased() {
  if (but.isHovering() && but.getVisib()) {
    for (TextBox txt : boxes) {
      txt.setVisib(true);
    }
    but.setVisib(false);
    but2.setVisib(true);
    am.setVisib(true);
    pm.setVisib(true);
    
    eventName.setText("");
    year.setText("" + year());
    month.setText("" + month());
    day.setText("" + day());
    hour.setText("" + hour() % 12);
    minute.setText("" + minute());
  }
  // show text boxes when new event is pressed
  
  if (but2.isHovering() && but2.getVisib()) {
    
    int hours = hour.value();
    if (!am.getSelected()) {
      hours += 12;
    }
    Time t = new Time(eventName.toString(), year.value(), month.value(), day.value(), hours, minute.value());
    if (t.getValidInput()) {
      al.add(t);
      for (TextBox txt : boxes) {
        txt.setVisib(false);
      }
      but2.setVisib(false);
      if (al.size() < 5) {
        but.setVisib(true);
      } 
      but.setVisib(true);
      am.setVisib(false);
      pm.setVisib(false);
      errMsg = false;
    } else {
      errMsg = true;
    }
    //else {
    //    fill(255);
    //    text("Error: Invalid Input Entered", 250, 450);
    //}
  }
  // hide text boxes when add event is pressed
  
  if (am.isHovering() && am.getVisib()) {
    am.setSelected(true);
    pm.setSelected(false);
  }
  if (pm.isHovering() && pm.getVisib()) {
    pm.setSelected(true);
    am.setSelected(false);
  }
  
  for (TextBox txt : boxes) {
    if (txt.isHovering()) {
      txt.setSelected(true);
    } else {
      txt.setSelected(false);
    }
  }
  // select text boxes
}

// run each time user enters input
void keyPressed() {
  for (TextBox txt : boxes) {
    txt.type(key);
  }
}