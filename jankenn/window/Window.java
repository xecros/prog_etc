package jankenn.window;

import jankenn.syori.Hand;
import jankenn.syori.Status;
import javax.swing.*;

public class Window {

  private final JFrame frame;
  private final JLabel message;

  private final JButton rockButton;
  private final JButton scissorsButton;
  private final JButton paperButton;

  private Status playState;

  private Hand randHand;

  public Window() {

    this.frame = new JFrame("jankenn game!");
    this.frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    this.frame.setBounds(200, 200, 630, 400);

    var pane = this.frame.getContentPane();
    var canvas = new JPanel();

    canvas.setLayout(null);

    this.message = new JLabel("jankenn start!");
    this.message.setBounds(20, 20, 400, 50);
    canvas.add(this.message);

    this.rockButton = new JButton(Hand.Rock.getDisplay());
    this.rockButton.setBounds(50, 150, 100, 50);
    this.rockButton.addActionListener((e) -> this.selectHand(Hand.Rock));
    canvas.add(this.rockButton);

    this.scissorsButton = new JButton(Hand.Scissors.getDisplay());
    scissorsButton.setBounds(250, 150, 100, 50);
    this.scissorsButton.addActionListener((e) -> this.selectHand(Hand.Scissors));
    canvas.add(scissorsButton);

    this.paperButton = new JButton(Hand.Paper.getDisplay());
    paperButton.setBounds(450, 150, 100, 50);
    this.paperButton.addActionListener((e) -> this.selectHand(Hand.Paper));
    canvas.add(paperButton);

    pane.add(canvas);
  }

  public void show() {
    this.reset();
    this.frame.setVisible(true);
  }

  public void reset() {
    this.randHand = Hand.getRandomHand();
    this.playState = Status.Wait;
  }

  public void selectHand(Hand select) {
    if (this.playState != Status.Wait) {
      return;
    }

    switch ((select.getNumber() - randHand.getNumber() + 3) % 3) {
      case 0:
        this.message.setText("even!");
        this.reset();
        break;
      case 1:
        this.message.setText(String.format
        ("Enemy is %s! Lose!", this.randHand.getDisplay()));
        this.playState = Status.Done;
        break;
      case 2:
        this.message.setText(String.format
        ("Enemy is %s! Win!", this.randHand.getDisplay()));
        this.playState = Status.Done;
        break;
    }
  }

}