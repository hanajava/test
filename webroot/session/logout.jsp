<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0) {
        for (Cookie cookie: cookies) {
            //유효시간을 0 으로 지정하면 쿠키가 삭제된다.
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }

    session.invalidate();
	response.sendRedirect("login.jsp");
%>