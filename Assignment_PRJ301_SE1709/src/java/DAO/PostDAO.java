/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Comment;
import Model.Post;
import Model.Role;
import Model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author anhth
 */
public class PostDAO extends DBContext {

    public ArrayList<Post> getListPost() {
        ArrayList<Post> pList = new ArrayList<>();
        try {
            String sql = "select * from Post_Ass";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //int postID, String title, String content, boolean status, String image, String description, int liked, Users user, Comment comment
                int userID = rs.getInt(7);
                Users u = getUserByUserID(userID);
                Post p = new Post(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getString(5), rs.getString(6), rs.getInt((8)), u);
                pList.add(p);
            }
        } catch (SQLException e) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return pList;
    }

//    public Post getPostByUserID() {
//        
//    }
    private Users getUserByUserID(int userID) {
        try {
            String sql = "select * from [User] where userID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Role r = new Role(rs.getInt(1), rs.getString(2));
                Users u = new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), rs.getString(12), r);
                return u;
            }
        } catch (SQLException e) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void addPost(String description, int userID) {
        try {
            String sql = "INSERT INTO [dbo].[Post_Ass]\n"
                    + "           ([title]\n"
                    + "           ,[content]\n"
                    + "           ,[status]\n"
                    + "           ,[image]\n"
                    + "           ,[description]\n"
                    + "           ,[userID]\n"
                    + "           ,[liked]\n"
                    + "           ,[date])\n"
                    + "     VALUES\n"
                    + "           (0,0,0,0,?,?,0,'')";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, description);
            stm.setInt(2, userID);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deletePost(String postID) {
        try {
            String sql = "DELETE FROM [dbo].[Post_Ass]\n"
                    + "      WHERE postID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, postID);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void editPost(int postID, int userID, String description) {
        try {
            String sql = "UPDATE [dbo].[Post_Ass]\n"
                    + "   SET [title] = 0\n"
                    + "      ,[content] = 0\n"
                    + "      ,[status] = 0\n"
                    + "      ,[image] = 0\n"
                    + "      ,[description] = ? \n"
                    + "      ,[userID] = ?\n"
                    + "      ,[liked] = 0\n"
                    + "      ,[date] = ''\n"
                    + " WHERE postID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, description);
            stm.setInt(2, userID);
            stm.setInt(3, postID);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<Post> getListPostbyID(String postID) {
        ArrayList<Post> listofPost = new ArrayList<>();
        try {
            String sql = "select * from Post_Ass where PostID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(postID));
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                //int postID, String title, String content, boolean status, String image, String description, int liked, Users user
                int userID = rs.getInt(7);
                Users u = getUserByUserID(userID);
                Post p = new Post(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getString(5), rs.getString(6), rs.getInt((8)), u);
                listofPost.add(p);
            }
        } catch (NumberFormatException | SQLException e) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return listofPost;
    }

   
}
