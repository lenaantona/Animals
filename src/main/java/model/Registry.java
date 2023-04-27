package model;

import java.util.ArrayList;
import java.util.Iterator;
/**
 * класс реестра, содержит перечень домашних животных
 * */
public class Registry implements Iterable<HomeAnimals>{

    private ArrayList<HomeAnimals> registry; //реестр домашних животных

    public Registry() {
        this.registry = new ArrayList<>();
    }

    public ArrayList<HomeAnimals> getRegistry() {
        return registry;
    }


    public void addRegistry (HomeAnimals a){ //метод добавления объекта в массив
       this.registry.add(a);
    }

    @Override
    public Iterator<HomeAnimals> iterator() {
        return registry.iterator();
    }


    public void printRegistry(){ //вывод всех животных в реестре
        for (HomeAnimals a: this.getRegistry()){
            System.out.println(a.getInfo());
        }
    }

    public HomeAnimals searchAnimals(Integer id){ //поиск животного по id
        for (HomeAnimals a: this.getRegistry()){
            if (a.getId()== id) {
                return a;
            };
        }
        return null;
    }

}

