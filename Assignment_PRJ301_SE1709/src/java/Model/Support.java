/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author anhth
 */
public class Support {
    private int supID;
    private String sup_username;
    private String sup_mail;
    private String sup_message;
    private Users user;

    public Support() {
    }

    public Support(int supID, String sup_username, String sup_mail, String sup_message, Users user) {
        this.supID = supID;
        this.sup_username = sup_username;
        this.sup_mail = sup_mail;
        this.sup_message = sup_message;
        this.user = user;
    }

    public int getSupID() {
        return supID;
    }

    public void setSupID(int supID) {
        this.supID = supID;
    }

    public String getSup_username() {
        return sup_username;
    }

    public void setSup_username(String sup_username) {
        this.sup_username = sup_username;
    }

    public String getSup_mail() {
        return sup_mail;
    }

    public void setSup_mail(String sup_mail) {
        this.sup_mail = sup_mail;
    }

    public String getSup_message() {
        return sup_message;
    }

    public void setSup_message(String sup_message) {
        this.sup_message = sup_message;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }
    
    
}
