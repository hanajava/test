<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="net.hanajava.test.jboss.UserInfo"%>
<%
    System.out.println("login.jsp => "+session.getId());

    UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
    if(userInfo != null) {
        response.sendRedirect("main.jsp");
        return;
    }
%>
<html>
<body>
<h3><%=request.getRequestURL()%></h3>
<form method="POST" name="f1" action="loginworker.jsp">
<table>
    <tr>
        <td>id</td>
        <td><input type=text name=id></td>
    </tr>
    <tr>
        <td>name</td>
        <td><input type=text name=name></td>
    </tr>
    <tr>
        <td>empno</td>
        <td><input type=text name=empno></td>
    </tr>
    <tr>
        <td>SessionID</td>
        <td><%=session.getId()%></td>
    </tr>
    <tr height=20px>
        <td colspan=2> </td>
    </tr>
    <tr align=center>
        <td colspan=2>
        <INPUT type="button" value="LOGIN" onClick="document.f1.submit();">
        <a href="logout.jsp"><INPUT type="button" value="Clear" onClick=""></a>
        </td>
    </tr>
</table>
</form>
</body>
</html>