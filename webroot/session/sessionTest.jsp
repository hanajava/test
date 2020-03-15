<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.InetAddress" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" " http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SessionTest</title>
</head>
<body>
<%
    String color = "";
    Integer count = (Integer)session.getAttribute("count");
    if (session.getAttribute("count")==null) {
     count = new Integer(1);
    } else {
      count = new Integer(count.intValue()+1);
    }

    session.setAttribute("count",count);
    InetAddress iadr = InetAddress.getLocalHost();
%>
<b>Connect count</b> : <font color=red><%=count%></font>&nbsp;
<a href=<%="http://"+request.getServerName()+request.getRequestURI()%>>[HTTP]</a>&nbsp;
<a href=<%="https://"+request.getServerName()+request.getRequestURI()%>>[HTTPS]</a><BR>
<P>
<H3>Session Information</H3>
<b>ㅁ HostName</b> : <%=System.getenv("HOSTNAME")%><BR>
<b>ㅁ Session ID</b> : <%=session.getId()%><BR>
<b>ㅁ Session Is New</b> : <%=session.isNew()%><BR>
<b>ㅁ Session CreationTime</b> : <%=new Date(session.getCreationTime())%><BR>
<b>ㅁ Session LastAccessedTime</b> : <%=new Date(session.getLastAccessedTime())%><BR>
<b>ㅁ Session MaxInactiveInterval(s)</b> : <%=session.getMaxInactiveInterval()%><BR>
<P>
<a href=<%="http://"+request.getServerName()+request.getContextPath()+"/sessionInit.jsp"%>>[HTTP]Session Init</a>&nbsp;
<a href=<%="https://"+request.getServerName()+request.getContextPath()+"/sessionInit.jsp"%>>[HTTPS]Session Init</a><br>
<table border=1>
<tr>
    <td>getScheme()</td>
    <td><%=request.getScheme()%></td>
</tr>
<tr>
    <td>getServerName()</td>
    <td><%=request.getServerName()%></td>
</tr>
<tr>
    <td>getContextPath()</td>
    <td><%=request.getContextPath()%></td>
</tr>
<tr>
    <td>getRequestURI()</td>
    <td><%=request.getRequestURI()%></td>
</tr>
<tr>
    <td>getRequestURL()</td>
    <td><%=request.getRequestURL()%></td>
</tr>
<tr>
    <td>getRequestURL().substring()</td>
    <td><%=request.getRequestURL().substring(0,request.getRequestURL().lastIndexOf("/"))%></td>
</tr>
</table>
</body>
</html>
