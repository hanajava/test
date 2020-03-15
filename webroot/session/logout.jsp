<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0) {
        for (Cookie cookie: cookies) {
            //��ȿ�ð��� 0 ���� �����ϸ� ��Ű�� �����ȴ�.
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }

    session.invalidate();
	response.sendRedirect("login.jsp");
%>