package javaServerlet;

public class Member {

    private String name, email;
    private int id;

    public Member() {
        super();
    }

    public Member(int id,String name,String email) {
        super();
        this.name = name;
        this.email = email;
        this.id = id;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
