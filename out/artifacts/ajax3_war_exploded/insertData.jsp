<%--
  Created by IntelliJ IDEA.
  user: paul
  Date: 2017. 10. 20.
  Time: PM 6:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.UserDTO" scope="request"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userAge"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<%
    UserDAO DAO = new UserDAO();
    PrintWriter writer = response.getWriter();
    int result = DAO.insertUser(user);
    if(result == -1){
        writer.println("<script>");
        writer.println("alert('다시 시도해주세요.');history.back();");
        writer.println("</script>");
    }
    else{
        writer.println("<script>");
        writer.println("alert('성공.');location.href='insertForm.jsp'");
        writer.println("</script>");
    }

%>
</body>
</html>
