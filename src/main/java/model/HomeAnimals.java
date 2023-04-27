package model;

import java.util.ArrayList;
import java.util.List;

public class HomeAnimals extends Animals{

    private String TypeAnimal = "домашние животные";

    private List<String> commands;

    public HomeAnimals(Integer id, String nickname, String birthday) {
        super(id, nickname, birthday);
        this.commands = new ArrayList<>();
    }

    @Override
    public String getInfo() {
        return String.format("%s,  Type: %s",
                super.getInfo(), this.TypeAnimal);
    }

    @Override
    public Integer getId() {
        return super.getId();
    }


    public void setCommands(String commands) {
        this.commands.add(commands);
    }

    public List<String> getCommands() {
        return commands;
    }

    public String getTypeAnimal() {
        return TypeAnimal;
    }
}
