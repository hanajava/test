<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<%
    // �����ͺ��̽� ������� ���� ����
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // �����ͺ��̽� ������������� ���ڿ��� ����
    String jdbc_driver = "com.mysql.jdbc.Driver";
    String jdbc_url = "jdbc:mysql://192.168.110.141:13306/mysql?serverTimezone=UTC";
    out.println("jdbc_driver : "+jdbc_driver+"<br/>");
    out.println("jdbc_url : "+jdbc_url+"<br/>");
    System.out.println("jdbc_driver : "+jdbc_driver);
    System.out.println("jdbc_url : "+jdbc_url);

    try {
        // JDBC ����̹� �ε�
        Class.forName(jdbc_driver);

        // �����ͺ��̽� ���������� �̿��� Connection �ν��Ͻ� Ȯ��
        conn = DriverManager.getConnection(jdbc_url,"pinpoint","pinpoint1!");

        // Connection Ŭ������ �ν��Ͻ��� ���� SQL  �� �ۼ��� ���� Statement �غ�
        pstmt = conn.prepareStatement("select host, user, password from mysql.user");
        rs = pstmt.executeQuery();
        while(rs.next()) {
        out.println(rs.getString("host")+" : "+ rs.getString("user")+"<br/>");
        System.out.println(rs.getString("host")+" : "+ rs.getString("user"));
        }
        rs.close();
        pstmt.close();
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if(conn != null) {
                conn.close(); // �ʼ� ����
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
