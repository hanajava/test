<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*"%>
HashMap Test Start...<br/>
<%
    Map map = new HashMap();
    double sum=0;
    double start = System.currentTimeMillis();
    for (int i=0; i<10000000; i++) {
        map.put(i+"", new Integer(i));
    }
    out.println("HashMap new created. Count="+map.size()+" "+(System.currentTimeMillis()-start)/1000D+"s</br>");

    Integer integer = new Integer(0);
    for (int i=0; i<map.size(); i++) {
        if( map.containsKey(i+"") ){
            integer = (Integer)map.get(i+"");
        }
        if( i>0 && i%10000 == 0) {
            out.println("th => "+i+"  Elapsed : "+(System.currentTimeMillis()-start)/1000D+"s <br>");
            //Thread.sleep(10);
        }
    }

    if((System.currentTimeMillis()-start)/1000D > 30D) {
        out.println(map.size()+"TH Time 30secs Over~~~");
        //break;
    }
%>
HashMap Test Finished...