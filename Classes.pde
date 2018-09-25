/**
 Rectangle object. 
 @param x x-coordinate of center
 @param y y-coordinate of center
 @param w width of Rectangle (x-dimension)
 @param h height of Rectangle (y-dimension)
 @param c color of Rectangle
 */
public class Rectangle {
  private int x;
  private int y;
  private int w;
  private int h;
  private color c;
  private boolean visible;

  // creates new Button object
  public Rectangle() {
    x = y = w = h = c = 0;
    visible = true;
  }

  // creates new Button object
  public Rectangle(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    visible = true;
  }

  // creates new Button object
  public Rectangle(int x, int y, int w, int h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    visible = true;
  }

  // get methods
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public int getWidth() {
    return w;
  }
  public int getHeight() {
    return h;
  }
  public color getColor() {
    return c;
  }
  public boolean getVisib() {
    return visible;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  public void setColor(color c) {
    this.c = c;
  }
  public void setVisib(boolean visible) {
    this.visible = visible;
  }

  // checks if mouse is hovering over Button
  public boolean isHovering() {
    if (mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2) {
      return true;
    }
    return false;
  }

  // draws Button
  public void drawShape() {
    if (visible) {
      fill(c);
      rect(x, y, w, h);
    }
  }

  // returns center coordinates of Button
  public String toString() {
    return "(" + x + ", " + y + ")";
  }
}
 
/**
 Button object. 
 @param x x-coordinate of center
 @param y y-coordinate of center
 @param w width of Button (x-dimension)
 @param h height of Button (y-dimension)
 @param c color of Buttton
 */
public class Button extends Rectangle{
  String text;
  
  // creates new Button object
  public Button() {
    super();
    text = "";
  }

  // creates new Button object
  public Button(int x, int y, int w, int h) {
    super(x, y, w, h);
    text = "";
  }

  // creates new Button object
  public Button(int x, int y, int w, int h, String text) {
    super(x, y, w, h);
    this.text = text;
  }

  // draws Button
  public void drawShape() {
    if (this.getVisib()) {
      if (this.isHovering()) {
        this.setColor(#D86D6D);
      } else {
        this.setColor(#ED8888);
      }
      fill(this.getColor());
      noStroke();
      rect(this.getX(), this.getY(), this.getWidth(), this.getHeight());
      fill(0);
      text(text, this.getX(), this.getY());
    }
  }
  
  public String toString() {
    return text;
  }
}

/**
 SelectionButton object. 
 @param x x-coordinate of center
 @param y y-coordinate of center
 @param w width of Button (x-dimension)
 @param h height of Button (y-dimension)
 @param c color of Buttton
 */
public class SelectionButton extends Button {
  boolean selected;
  
  // creates new Button object
  public SelectionButton() {
    super();
  }

  // creates new Button object
  public SelectionButton(int x, int y, int w, int h) {
    super(x, y, w, h);
  }

  // creates new Button object
  public SelectionButton(int x, int y, int w, int h, String text) {
    super(x, y, w, h, text);
  }
  
  public void setSelected(boolean selected) {
    this.selected = selected;
  }
  public boolean getSelected() {
    return selected;
  }

  // draws Button
  public void drawShape() {
    if (this.getVisib()) {
      if (selected) {
        this.setColor(#D86D6D);
      } else {
        this.setColor(#ED8888);
      }
      fill(this.getColor());
      noStroke();
      rect(this.getX(), this.getY(), this.getWidth(), this.getHeight());
      fill(0);
      text(text, this.getX(), this.getY());
    }
  }
}

/**
 TextBox object. 
 @param x x-coordinate of center
 @param y y-coordinate of center
 @param w width of TextBox (x-dimension)
 @param h height of TextBox (y-dimension)
 @param c color of TextBox
 */
public class TextBox extends Rectangle {
  boolean selected;
  String text;
  String label;
  
  // creates new TextBox object
  public TextBox() {
    super();
    text = "";
  }

  // creates new TextBox object
  public TextBox(int x, int y, int w, int h) {
    super(x, y, w, h);
    this.setColor(255);
    text = "";
    label = "";
  }

  // creates new TextBox object
  public TextBox(int x, int y, int w, int h, String label) {
    super(x, y, w, h);
    this.setColor(255);
    text = "";
    this.label = label;
  }
  
  public void setSelected(boolean selected) {
    this.selected = selected;
  }
  public void setText(String text) {
    this.text = text;
  }
  
  public void type(char keyTyped) {
    if (selected) {
      if ((key > 31) && (key != CODED)) {
        // If the key is a number, add it to the String
        text = text + keyTyped;
      } else if (keyTyped == BACKSPACE && text.length() > 0) {
        text = text.substring(0, text.length() - 1);
      }
    }
  }

  // draws TextBox
  public void drawShape() {
    if (this.getVisib()) {
      if (selected) {
        this.setColor(255);
      } else {
        this.setColor(160);
      }
      fill(this.getColor());
      stroke(0);
      rect(this.getX(), this.getY(), this.getWidth(), this.getHeight());
      fill(0);
      text(text, this.getX(), this.getY());
      fill(255);
      text(label, this.getX(), this.getY() + this.getHeight()/2 + 20);
    }
  }
  
  public String toString() {
    return text;
  }
}

/**
 NumTextBox object. 
 @param x x-coordinate of center
 @param y y-coordinate of center
 @param w width of NumTextBox (x-dimension)
 @param h height of NumTextBox (y-dimension)
 @param c color of NumTextBox
 */
public class NumTextBox extends TextBox {
  int num = 2;
  int defaultVal;
  
  // creates new TextBox object
  public NumTextBox() {
    super();
    defaultVal = 0;
  }

  // creates new TextBox object
  public NumTextBox(int x, int y, int w, int h, int defaultVal) {
    super(x, y, w, h);
    this.setText("" + defaultVal);
  }

  // creates new TextBox object
  public NumTextBox(int x, int y, int w, int h, int defaultVal, String label) {
    super(x, y, w, h, label);
    this.setText("" + defaultVal);
  }
  
  public void isYear() {
    num = 4;
  }
  
  public void type(char keyTyped) {
    if (selected) {
      if (text.length() < num && (keyTyped > 47) && (keyTyped < 58)) {
        // If the key is a number, add it to the String
        text = text + keyTyped;
      } else if (keyTyped == BACKSPACE && text.length() > 0) {
        text = text.substring(0, text.length() - 1);
      }
    }
  }
  
  public int value() {
    int number = Integer.parseInt(text);
    return number;
  }
}