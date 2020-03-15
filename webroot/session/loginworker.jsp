<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="net.hanajava.test.jboss.UserInfo"%>
<%
    System.out.println("loginworker.jsp => "+session.getId());
    String method = request.getMethod();
    System.out.println("request.getMethod()=>"+request.getMethod());
    if ("POST".equals(method)) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String empno = request.getParameter("empno");

        UserInfo userInfo = new UserInfo();
        userInfo.setId(id);
        userInfo.setName(name);
        userInfo.setEmpno(empno);
        userInfo.setServerPeerID(session.getId());
        session.setAttribute("userInfo", userInfo);
        System.out.println("UserInfo => "+userInfo);

        //response.setHeader("Set-Cookie", "SameSite_KEY1=hanajava.net;SameSite=None;Secure;");
        //response.setHeader("Set-Cookie", "SameSite_KEY2=hanaduna.net;SameSite=None;Secure;");

        Cookie cookie1 = new Cookie("CLIENT_CD", request.getServerName());
        response.addCookie(cookie1);

        Cookie cookie2 = new Cookie("USER_KEY", empno);
        response.addCookie(cookie2);

        //response.setHeader("Set-Cookie", "JSESSIONID="+session.getId()+";Http-Only;Secure;SameSite=None;");

        response.sendRedirect("main.jsp");
    }
%>