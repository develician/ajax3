package user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String userName = request.getParameter("userName");
        String userAge = request.getParameter("userAge");
        String userGender = request.getParameter("userGender");
        String userEmail = request.getParameter("userEmail");
        response.getWriter().write(register(userName, userAge, userGender, userEmail) + "");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String userName = request.getParameter("userName");
        String userAge = request.getParameter("userAge");
        String userGender = request.getParameter("userGender");
        String userEmail = request.getParameter("userEmail");
        response.getWriter().write(register(userName, userAge, userGender, userEmail) + "");

    }

    private int register(String userName, String userAge, String userGender, String userEmail) {
        UserDTO DTO = new UserDTO();
        try{
            DTO.setUserName(userName);
            DTO.setUserAge(Integer.parseInt(userAge));
            DTO.setUserGender(userGender);
            DTO.setUserEmail(userEmail);
        }
        catch(Exception e){
            e.printStackTrace();
            return 0;
        }

        return new UserDAO().register(DTO);
    }
}
