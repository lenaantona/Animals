package model;

public class Counters {
    private Integer id;

    public Counters() {
        this.id = 0;
    }

    public Integer getId() {
        return id;
    }

    public Integer add(){
        id = id + 1;
        return id;
    }
}
