import presenter.Controller;
import view.ConsoleTerminal;

public class Main {//точка входа в программу
    public static void main(String[] args) throws Exception {
        ConsoleTerminal view = new ConsoleTerminal();
        Controller con = new Controller(view);
        view.start();
    }
}     
