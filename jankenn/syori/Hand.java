package jankenn.syori;
import java.util.Random;

public enum Hand {
  Rock("Rock", 0),
  Scissors("Scissors", 1),
  Paper("Paper", 2);

  private final String display;
  private final int number;

  Hand(String display, int number) {
    this.display = display;
    this.number = number;
  }

  public static Hand getRandomHand() {
    Random rand = new Random();
    return Hand.values()[rand.nextInt(3)];
  }

  public String getDisplay() {
    return this.display;
  }

  public int getNumber() {
    return this.number;
  }
}