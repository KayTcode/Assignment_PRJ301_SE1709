/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author anhth
 */
public class Post {
    private int postID;
    private String title;
    private String content;
    private boolean status;
    private String image;
    private String description;
    private int liked;
    private Users user;
    private ArrayList<Comment> comment;
    
    public Post() {
    }

    public Post(int postID, String title, String content, boolean status, String image, String description, int liked, Users user) {
        this.postID = postID;
        this.title = title;
        this.content = content;
        this.status = status;
        this.image = image;
        this.description = description;
        this.liked = liked;
        this.user = user;
    }

    public Post(String desciption) {
        this.description = description;
    }
     

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    

    public int getLiked() {
        return liked;
    }

    public void setLiked(int liked) {
        this.liked = liked;
    }


    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    } 
}
