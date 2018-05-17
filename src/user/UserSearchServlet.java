package user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class UserSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String userName = request.getParameter("userName");

        response.getWriter().write(getJSON(userName));

        PrintWriter out = response.getWriter();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String userName = request.getParameter("userName");

        response.getWriter().write(getJSON(userName));


    }

    public String getJSON(String userName){
        if(userName == null){
            userName = "";
        }
        StringBuffer result = new StringBuffer("");
        result.append("{\"result\":[");
        UserDAO DAO = new UserDAO();
        ArrayList<UserDTO> userList = DAO.search(userName);
        for(int i = 0;i<userList.size();i++){
            result.append("[{\"value\": \"" + userList.get(i).getUserName() + "\"},");
            result.append("{\"value\": \"" + userList.get(i).getUserAge() + "\"},");
            result.append("{\"value\": \"" + userList.get(i).getUserGender() + "\"},");
            result.append("{\"value\": \"" + userList.get(i).getUserEmail() + "\"}],");
        }
        result.append("]}");
        return result.toString();

    }
}
