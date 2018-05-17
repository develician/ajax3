package user;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO {
    Connection conn;
    ResultSet rs;
    PreparedStatement pstmt;

    public UserDAO(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String URL = "jdbc:mysql://localhost:3306/ajaxpractice";
            String userID = "root";
            String userPassword = "ehdgh3333";
            conn = DriverManager.getConnection(URL, userID, userPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public int insertUser(UserDTO DTO){
        String SQL = "insert into user values(?, ?, ?, ?)";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, DTO.getUserName());
            pstmt.setInt(2, DTO.getUserAge());
            pstmt.setString(3, DTO.getUserGender());
            pstmt.setString(4, DTO.getUserEmail());
            return pstmt.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }


    public ArrayList<UserDTO> search(String userName){
        String SQL = "select * from user where userName Like ?";
        ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, "%" + userName + "%");
            rs = pstmt.executeQuery();
            while(rs.next()){
                UserDTO DTO = new UserDTO();
                DTO.setUserName(rs.getString("userName"));
                DTO.setUserAge(rs.getInt("userAge"));
                DTO.setUserGender(rs.getString("userGender"));
                DTO.setUserEmail(rs.getString("userEmail"));
                userList.add(DTO);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return userList;
    }

    public int register(UserDTO DTO){
        String SQL = "insert into user values(?, ?, ?, ?)";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, DTO.getUserName());
            pstmt.setInt(2, DTO.getUserAge());
            pstmt.setString(3, DTO.getUserGender());
            pstmt.setString(4, DTO.getUserEmail());
            return pstmt.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }
}
