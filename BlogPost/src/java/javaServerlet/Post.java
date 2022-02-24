/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaServerlet;

/**
 *
 * @author Jamit
 */
public class Post {
    private int postId;
    private String title,description,userName;

    public Post(int postId, String title, String description, String userName) {
        this.postId = postId;
        this.title = title;
        this.description = description;
        this.userName = userName;
    }

    public int getPostId() {
        return postId;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getUserName() {
        return userName;
    }
    
    
}
