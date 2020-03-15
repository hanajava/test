<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="net.hanajava.test.jboss.UserInfo"%>
<%
    UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
    if(userInfo == null) {
        userInfo = new UserInfo();
        response.sendRedirect("login.jsp");
        return;
    }

    Cookie[] cookies = request.getCookies();
%>
<html>
<body>
<h3><%=request.getRequestURL()%></h3>
<table>
    <tr>
        <td>id</td>
        <td><%=userInfo.getId()%></td>
    </tr>
    <tr>
        <td>name</td>
        <td><%=userInfo.getName()%></td>
    </tr>
    <tr>
        <td>empno</td>
        <td><%=userInfo.getEmpno()%></td>
    </tr>
    <tr>
        <td>QueryString</td>
        <td><%=request.getQueryString()%></td>
    </tr>
    <tr height=20px>
        <td colspan=2> </td>
    </tr>
    <tr height=20px>
        <td colspan=2><strong>Cookie List</strong></td>
    </tr>
    <%-- for (int i = 0 ; i < cookies.length ; i++) { --%>
    <% for(Cookie cookie : cookies){ %>
   <tr>
        <td><%=cookie.getName()%></td>
        <td><%=cookie.getValue()%></td>
    </tr>
    <% } %>
    <tr height=20px>
        <td colspan=2> </td>
    </tr>
    <tr align=center>
        <td colspan=2>
        <a href="javascript:this.close();"><INPUT type="button" value="CLOSE"></a>
        </td>
    </tr>
</table>
</table>
</body>
</html>