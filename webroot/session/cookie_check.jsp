<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="net.hanajava.test.jboss.UserInfo"%>
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
<head>
<script type="text/javascript">
    //쿠키(Cookie) 저장하기
    var setCookie = function(form) {
        var name  = form.cname.value;
        var value = form.cvalue.value;
        var date = new Date();
        //date.setDate(date.getDate() + 7);
        date.setTime(date.getTime() + 1*24*60*60*1000);
        //date.setTime(date.getTime() + 10*60*1000);
        document.cookie = name + '=' + value + ';expires=' + date.toGMTString() + ';domain=<%=request.getServerName()%>;path=<%=request.getContextPath()%>';
        alert(document.cookie);
        document.f1.submit();
    };

    //쿠키(Cookie) 가져오기
    var getCookie = function(name) {
        var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
        return value? value[2] : null;
    };

    //쿠키(Cookie) 삭제하기
    var deleteCookie = function(name) {
        var todayDate = new Date();
        todayDate.setDate(todayDate.getDate() - 1);
        document.cookie = name + "=;expires=" + todayDate.toGMTString()+";domain=<%=request.getServerName()%>;path=<%=request.getContextPath()%>";
        alert(document.cookie);
        //document.cookie = name + "=; expires=" + todayDate.toGMTString()+";";
        //document.cookie = name + '=; expires=' + date.toUTCString();
        document.f1.submit();
    };

    var showCookie = function(){
        alert(document.cookie);
    };
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
        <td><%=URLDecoder.decode(cookie.getValue(), "euc-kr")%></td>
    </tr>
    <% } %>
    <tr height=20px>
        <td colspan=2> </td>
    </tr>
    <tr align=center>
        <td colspan=2><a href="logout.jsp"><INPUT type="button" value="Logout" onClick="document.f1.submit();"></a></td>
    </tr>
</table>
[Set Cookie]==============================
<form name=f1 action=cookie_test.jsp>
<br/> cookie_name :
<input type="text" id="cookiename" name="cname"/>
<br/> cookie_value :
<input type="text" id="cookievalue" name="cvalue" />
<input type="button" value="set Cookie" onclick="setCookie(document.f1);"/><br>
</form>
<form name=f2>
<br/> [Get Cookie]==========================
<br/> get cookie_name :
<input type="text" id="getcookiename" name="cname"/>
<input type="button" value="Get Cookie" onclick="alert(getCookie(document.f2.cname.value));"/><br>
</form>
<form name=f3>
<br/> [Del Cookie]============================
<br/> del cookie_name :
<input type="text" id="delcookiename" name="cname"/>
<input type="button" value="Delete Cookie" onclick="deleteCookie(document.f3.cname.value);"/>
<br/>
</form>
<input type="button" value="Show Cookie" onclick="showCookie();" />
</body>
</html>