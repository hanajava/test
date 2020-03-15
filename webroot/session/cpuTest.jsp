<%@ page contentType="text/html; charset=euc-kr" %>
CPU Test Start...<br/>
<%
    int i=0;
    int sum=0;
    while (i<=100) {
        sum=sum+i;
        i++;
        out.println("i = "+i +", sum = "+sum+"<br/>");
    }
%>
CPU Test Finished...

