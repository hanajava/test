<%@ page contentType="text/html; charset=euc-kr" %>
CPU Test2 Start...<br/>
<%
    long i=0;
    long sum=0;
    double start = System.currentTimeMillis();
    while (true) {
        sum=sum+i;
        i++;
        if (i>0 && i%1000000 == 0) {
            out.println("th => "+i+"  Elapsed : "+(System.currentTimeMillis()-start)/1000D+"s <br>");
            //Thread.sleep(10);
        }

        if((System.currentTimeMillis()-start)/1000D > 120D) {
            out.println(i+"TH Time 60secs Over~~~");
            break;
        }
    }
%>
CPU Test2 Finished...

