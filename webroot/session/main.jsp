<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLDecoder" %>
<%@ page import="net.hanajava.test.jboss.UserInfo"%>
<%
    System.out.println("main.jsp => " + session.getId());

    UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
    if(userInfo == null) {
        //userInfo = new UserInfo();
        response.sendRedirect("login.jsp");
        return;
    }

    String nowURL = new String(request.getRequestURL());
    String httpURL = nowURL.replace("https:", "http:");
    String httpsURL = nowURL.replace("http:", "https:");
    System.out.println("nowURL => " + nowURL);
    System.out.println("httpURL => " + httpURL);
    System.out.println("httpsURL => " + httpsURL);
%>
<html>
<head>
<script>
function getCookie(name) {
    var arg = name + "=";
    var alen = arg.length;
    var clen = document.cookie.length;
    var i = 0;

    while (i < clen) {
    var j = i + alen;
    if (document.cookie.substring(i, j) == arg)
        return getCookieval (j);
      i = document.cookie.indexOf(" ", i) + 1;
      if (i == 0) break;
    }
    return null;
}

function getCookieval(offset) {
    var endstr = document.cookie.indexOf (";", offset);
    if (endstr == -1)
        endstr = document.cookie.length;
    return unescape(document.cookie.substring(offset, endstr));
}

function setCookie (name,value,expires,path,domain,secure) {
    document.cookie = name + "=" + escape (value) +
    ((expires) ? "; expires=" + expires.toGMTString() : "") +
    ((path) ? "; path=" + path : "") +
    ((domain) ? "; domain=" + domain : "") +
    ((secure) ? "; secure" : "");
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
        <td><%=URLDecoder.decode(userInfo.getName(), "euc-kr")%></td>
    </tr>
    <tr>
        <td>empno</td>
        <td><%=userInfo.getEmpno()%></td>
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
        <a href="logout.jsp"><INPUT type="button" value="Logout" !onClick=""></a>&nbsp;
        <a href="<%=httpURL%>"><INPUT type="button" value="HTTP" !onClick=""></a>&nbsp;
        <a href="<%=httpsURL%>"><INPUT type="button" value="HTTPS" !onClick=""></a>
        </td>
    </tr>
</table>
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