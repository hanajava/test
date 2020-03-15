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

    String serverName = request.getServerName();
    if("tomcat.ezwel.com".equals(serverName)){
        serverName = "tomcat.hanajava.net";
    } else {
        serverName = "tomcat.ezwel.com";
    }

    String httpAspURL = "http://"+serverName+request.getContextPath();
    String httpsAspURL = "https://"+serverName+request.getContextPath();

    Cookie[] cookies = request.getCookies();
%>
<html>
<head>
<script>
    function openPopup(){
        var url = "popup_pay.jsp";
        var name = "Payment Popup";
        var option = "width = 500, height = 500, top = 100, left = 200, location = no";
        window.open(url, name, option);
    }

    function submitHTTP(form){
        form.action = "<%=httpAspURL%>/pay_to_asp.jsp";
        form.submit();
    }

    function submitHTTPS(form){
        form.action = "<%=httpsAspURL%>/pay_to_asp.jsp";
        form.submit();
    }
</script>
</head>
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
        <INPUT type="button" value="Payment" onClick="openPopup();">&nbsp;
        <INPUT type="button" value="[HTTP]PayToAsp" onClick="submitHTTP(document.f1);">&nbsp;
        <INPUT type="button" value="[HTTPS]PayToAsp" onClick="submitHTTPS(document.f1);">&nbsp;
        <INPUT type="button" value="Popup" onClick="openPopup();">
        </td>
    </tr>
</table>
<form name=f1 action=''>
GOODS_CD : <input type=text name=goods_cd value=gcd1001><br>
GOODS_QTY : <input type=text name=goods_qty value=1><br>
GOODS_PRICE : <input type=text name=goods_price value=10000>
<form>
</body>
</html>