public class Time
{
  private String eventName;
  private int milli;
  private int second; 
  private int minute;
  private int hour;
  private int day;
  private int month;
  private int year;
  private int[] monthArray;
  private boolean validInput;
  private boolean passed;
  private String millisec;
  
  private int yearsLeft;
  private int monthsLeft;
  private int daysLeft;
  private int hoursLeft;
  private int minutesLeft;
  private int secondsLeft;
  private int millisLeft;
  
  //constructor for customized input of date, allowing user to input a year, month, day, hour,
        //and minute for countdown
  public Time(String eventName, int year, int month, int day, int hour, int minute)
  {
    this.eventName = eventName;
    
    int curYear = year();
    int curMonth = month();
    int curDay = day();
    int curHour = hour();
    int curMin = minute();
    int curMillis = millis();
    millisec = "";
    
    this.year = -1;
    this.month = -1;
    this.day = -1;
    this.hour = -1;
    this.minute = -1;
    this.second = 0;
    this.milli = 0;
    validInput = true;
    
    passed = false;
    
    //fill the monthArray with the appropriate values for days per each month
    if(year % 4 == 0) //if it's a leap year, change february's days from 27 to 28
    {
      monthArray = new int[]{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    }
    else
    {
      monthArray = new int[]{31, 27, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    }
    
    //will have to add else throw error for each part
    
    //checking for valid inputs
    if(year >= curYear) //if the inputted year isn't an earlier year than the current year
    {
      this.year = year; //assign the inputted year to the year value
      if(month > 0 && month <= 12) //if the month is between 1 and 12
      {
        if(curYear == year) //if in the same year
        {
          if(month >= curMonth) //if the new month is bigger than or equal to the current month
          {
            this.month = month; //assign the inputted month to the month variable
            if(day > 0 && day <= monthArray[month - 1]) //if the day is between 1 and the days in the month, represented in array
            { 
              if(curMonth == month) //if in the same month
              {
                if(day >= curDay) //if inputted day comes after or on the current day
                {
                  this.day = day; //assign the inputted day to the day variable
                  if(hour >= 0 && hour < 24) //if the hour falls between 0 and 23
                  {
                    if(curDay == day) //if on the same day
                    {
                      if(hour >= curHour) //if the inputted hour if bigger or equal to the current one
                      {
                        this.hour = hour; //assigns the inputted hour to the hour variable
                        if(minute >= 0 && minute < 60) //if the minute falls between 0 and 59
                        {
                          if(curHour == hour) //if in the same hour
                          {
                            if(minute >= curMin)
                            {
                              this.minute = minute;
                            }
                          }
                          else //if not in the same hour
                          {
                            this.minute = minute;
                          }
                        }
                      }
                    }
                    else //if not in the same day
                    {
                      this.hour = hour;
                      if(minute >= 0 && minute < 60) //if the minute falls between 0 and 59
                      {
                        this.minute = minute;
                      }
                    }
                  }
                }
              }
              else //if not in same month
              {
                this.day = day; //the day is valid
                if(hour >= 0 && hour < 24) //if the hour falls between 0 and 23
                {
                  this.hour = hour; //the hour is valid 
                }
                if(minute >= 0 && minute < 60) //if the minute falls between 0 and 59
                {
                  this.minute = minute; //the minute is valid
                }
              }
            }
          }
        }
        else //if not in same year
        {
         this.month = month; //month is good
         if(day > 0 && day <= monthArray[month - 1]) //if the day is between 1 and the days in the month, represented in array
         {
           this.day = day;
         }
         if(hour >= 0 && hour < 24) //if the hour falls between 0 and 23
         {
           this.hour = hour; //the hour is valid 
         }
         if(minute >= 0 && minute < 60) //if the minute falls between 0 and 59
         {
           this.minute = minute; //the minute is valid
         }
        }
      }
    }
    
    //if one of the variables doesn't change because it didn't match the above validity requirements, throw error)
    if(this.year == -1 || this.month == -1 || this.day == -1 || this.hour == -1 || this.minute == -1 || this.eventName == "")
    {
        validInput = false;
    }
  }
    
    //getter methods
    public String getEventName() {
      return eventName;
    }
    public int getYear()
    { 
      return year;
    }
    public int getMonth()
    {
      return month; 
    }
    public int getDay()
    {
     return day; 
    }
    public int getHour()
    {
     return hour;
    }
    public int getMinute()
    {
      return minute;
    }
    public int getSecond()
    {
      return second;
    }
    public int getMillis()
    {
      return milli;
    }
    
    public int getYearsLeft()
    { 
      return yearsLeft;
    }
    public int getMonthsLeft()
    {
      return monthsLeft; 
    }
    public int getDaysLeft()
    {
     return daysLeft; 
    }
    public int getHoursLeft()
    {
     return hoursLeft;
    }
    public int getMinutesLeft()
    {
      return minutesLeft;
    }
    public int getSecondsLeft()
    {
      return secondsLeft;
    }
    public String getMillisLeft()
    {
      return millisec;
    }
    
    public boolean getValidInput()
    {
      return validInput; 
    }
    public boolean getPassed() {
      return passed;
    }
    
    public void setEventName(String eventName) {
      this.eventName = eventName;
    }
    //year setter methods
    public void setYear(int newYear)
    {
      year = newYear;
    }
    //month setter method
    public void setMonth(int newMonth)
    {
      month = newMonth;
    }
    //day setter method
    public void setDay(int newDay)
    {
      day = newDay;
    }
    //hour setter method
    public void setHour(int newHour)
    {
        hour = newHour;
    }
    //minute setter method
    public void setMinute(int newMin)
    {
      minute = newMin;
    }

  public void subtraction() {
    Time time = this;
    
      //current computer times
      int curYear = year();
      int curMonth = month();
      int curDay = day();
      int curHour = hour();
      int curMinute = minute();
      int curSecond = second();
      int curMillis = millis();
      
      //holds the times from the inputted event
      int eventYears = time.getYear();
      int eventMonths = time.getMonth();
      int eventDays = time.getDay();
      int eventHours = time.getHour();
      int eventMinutes = time.getMinute();
      int eventSeconds = time.getSecond();
      int eventMillis = time.getMillis();
      
      yearsLeft = eventYears - curYear;
      monthsLeft = (eventMonths - curMonth) % 12;
      daysLeft = (eventDays - curDay) % 30;
      hoursLeft = (eventHours - curHour) % 24;
      minutesLeft = (eventMinutes - curMinute) % 60;
      secondsLeft = (eventSeconds - curSecond) % 60;
      millisLeft = (eventMillis - curMillis) % 1000;
      
      if (millisLeft < 0) {
        millisLeft += 1000;
        secondsLeft--;
      }
      millisec = "" + (1000 + millisLeft);
      millisec = millisec.substring(1);
      if (secondsLeft < 0) {
        secondsLeft += 60;
        minutesLeft--;
      }
      if (minutesLeft < 0) {
        minutesLeft += 60;
        hoursLeft--;
      }
      if (hoursLeft < 0) {
        hoursLeft += 24;
        daysLeft--;
      }
      if (daysLeft < 0) {
        daysLeft += 30;
        monthsLeft--;
      }
      if (monthsLeft < 0) {
        monthsLeft += 12;
        yearsLeft--;
      }
      if (yearsLeft < 0) {
        passed = true;
      }
}
}