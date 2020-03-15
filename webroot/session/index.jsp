<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hana webapps</title>
</head>
<body>
<h3>Welcome <%=request.getServerName()%>~~~</h3>
<table border=1 width=100% height=100%>
 <tr align=center>
    <td colspan=2>header</td>
 </tr>
 <tr>
    <td width=120px valign=top>
    left menu<br>
    - <a href="http://tomcat.hanajava.net/session/login.jsp" target=iframe1>[HTTP]login(hana)</a><br>
    - <a href="https://tomcat.hanajava.net/session/login.jsp" target=iframe1>[HTTPS]login(hana)</a><br>
    - <a href="http://tomcat.ezwel.com/session/login.jsp" target=iframe2>[HTTP]login(ezwel)</a><br>
    - <a href="https://tomcat.ezwel.com/session/login.jsp" target=iframe2>[HTTPS]login(ezwel)</a><br>
    <p>
    - <a href="<%=request.getScheme()%>://tomcat.hanajava.net/session/cookie_check.jsp" target=iframe1>check.jsp(hana)</a><br>
    - <a href="<%=request.getScheme()%>://tomcat.ezwel.com/session/cookie_check.jsp" target=iframe2>check.jsp(ezwel)</a><br>
    <p>
    - <a href="<%=request.getScheme()%>://tomcat.hanajava.net/session/cookie_test.jsp" target=iframe1>test.jsp(hana)</a><br>
    - <a href="<%=request.getScheme()%>://tomcat.ezwel.com/session/cookie_test.jsp" target=iframe2>test.jsp(ezwel)</a><br>
    <p>
    - <a href="<%=request.getScheme()%>://tomcat.hanajava.net/session/pay.jsp?client_cd=hanajava&user_key=hana10001" target=iframe1>pay.jsp(hana)</a><br>
    - <a href="<%=request.getScheme()%>://tomcat.ezwel.com/session/pay.jsp?client_cd=ezwel&user_key=ezwel10001" target=iframe2>pay.jsp(ezwel)</a><br>
    <p>
    - <a href="<%=request.getScheme()%>://tomcat.hanajava.net/session/pay_to_asp.jsp?client_cd=hanajava&user_key=hana10001" target=iframe1>pay_to_asp(hana)</a><br>
    - <a href="<%=request.getScheme()%>://tomcat.ezwel.com/session/pay_to_asp.jsp?client_cd=ezwel&user_key=ezwel10001" target=iframe2>pay_to_asp(ezwel)</a><br>
    </td>
    <td width=400px>
    <iframe name=iframe1 width=100% height=350px scrolling=auto src=login.jsp></iframe>
    <iframe name=iframe2 width=100% height=350px scrolling=auto src=login.jsp></iframe>
    </td>
 </tr>
 <tr align=center>
    <td colspan=2>footer</td>
 </tr>
 </table>
</body>
</html>