/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

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
public class UserDAO extends DBContext {

    public Users findAccount(String username, String password) {
        try {
            String sql = "select * from [User]\n"
                    + "where username =? and [password] = ?";

            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, username);
            pstm.setString(2, password);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                int role_id = rs.getInt(11);
                Role r = getRoleByID(role_id);
                //  Role r = new Role(rs.getInt(1), rs.getString(2));

                Users u = new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), rs.getString(12), r);
                return u;
            }
        } catch (SQLException e) {
        }
        return null;
    }
//    public static void main(String[] args) {
//        UserDAO u = new UserDAO();
//        Users s = u.findAccount("thanhch", "123");
//        System.out.println(s.getNickname());
//    }

    public Users checkUser(String username) {
        try {
            String sql = "select * from [User] where username = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getInt(1), rs.getString(2));
                Users u = new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), rs.getString(12), r);
                return u;
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void registerUser(String username, String password) {
        try {
            String sql = "Insert into [User] \n"
                    + "Values (?,?,0,0,0,'user',0,0,0,3,0)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    private Role getRoleByID(int role_id) {
        try {
            String sql = "select * from [Role] where roleID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, role_id);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Role(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public ArrayList<Users> getUserByAdmin() {
        ArrayList<Users> list = new ArrayList<>();
        try {
            String sql = "select * from [User] \n"
                    + "where roleID = 3";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int role_id = rs.getInt(11);
                Role r = getRoleByID(role_id);
                Users u = new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), rs.getString(12), r);

                list.add(u);
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);

        }
        return list;
    }

    public void delete(int userID) {
        try {
            String sql = "delete from [User] where userID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Users getUserByID(int id) {
        try {
            String sql = "select * from [User] where userID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int role_id = rs.getInt(11);
                Role r = getRoleByID(role_id);
                Users u = new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), rs.getString(12), r);
                return u;
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);

        }
        return null;
    }

    //(userID, password, firstname, lastname,address,nickname,gender,phonenumber,email,nationalnumber)
    public void updateUser(String userID, String password, String firstname, String lastname, String address, String nickname, String gender, String phonenumber, String email, String nationalnumber) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET \n"
                    + "       [password] = ?\n"
                    + "      ,[firstname] = ?\n"
                    + "      ,[lastname] = ?\n"
                    + "      ,[address] = ?\n"
                    + "      ,[nickname] = ?\n"
                    + "      ,[gender] = ?\n"
                    + "      ,[phonenumber] = ?\n"
                    + "      ,[email] = ?\n"
                    + "      ,[roleID] = 3\n"
                    + "      ,[nationalnumber] = ?\n"
                    + " WHERE userID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, firstname);
            stm.setString(3,lastname);
            stm.setString(4, address);
            stm.setString(5, nickname);
            stm.setBoolean(6,gender.equals("1"));
            stm.setString(7, phonenumber);
            stm.setString(8, email);
            stm.setString(9, nationalnumber);
            stm.setInt(10, Integer.parseInt(userID));
            stm.executeUpdate();
        } catch (SQLException e) {
             Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

}
