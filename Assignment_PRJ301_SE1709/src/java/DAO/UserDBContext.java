/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Role;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author anhth
 */
public class UserDBContext extends DBContext {

    public User getUser(String username, String password) {
        try {
            String sql = "select * from [User]\n"
                    + "where username = ? and [password] =?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFirstname(rs.getString("firstname"));
                user.setLastname(rs.getString("lastname"));
                user.setAddress(rs.getString("address"));
                user.setNickname(rs.getString("nickname"));
                user.setGender(rs.getBoolean("gender"));
                user.setPhonenumber(rs.getString("phonenumber"));
                user.setEmail(rs.getString("email"));
                user.setNationalnumber(rs.getString("nationalnumber"));
                
                Role role = new Role();
                role.setRoleID(rs.getInt("roleID"));
                role.setRolename(rs.getString("roleName"));
                user.setRole(role);
                
                return user;
                
            }
        } catch (SQLException e) {
             Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
}
