package model;

import java.util.List;

public class Dog extends HomeAnimals{
    private String ViewHomeAnimals = "собака";


    public Dog(Integer id, String nickname, String birthday) {
        super(id, nickname, birthday);
    }

    @Override
    public String getInfo() {
        return String.format("%s,  View: %s",
                super.getInfo(), this.ViewHomeAnimals);
    }

    @Override
    public void setCommands(String commands) {
        super.setCommands(commands);
    }

    @Override
    public List<String> getCommands() {
        return super.getCommands();
    }
}
