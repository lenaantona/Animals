package model;

public abstract class Animals {
    private Integer id;
    private String nickname;
    private String birthday;

    public Animals(Integer id, String nickname, String birthday) {
        this.id = id;
        this.nickname = nickname;
        this.birthday = birthday;
    }

    public Integer getId() {
        return id;
    }

    public String getNickname() {
        return nickname;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getInfo() {
        return String.format("id: %d  nickname: %s  birthday: %s",
                this.id, this.nickname, this.birthday);
    }
}
