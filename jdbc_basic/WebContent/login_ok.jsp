<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");// + "         ";
String pwd = request.getParameter("pwd");// + "         ";

//DB���� ������ ���� ���� ����
Connection conn = null;

//SQL���� �����ų �۾� ������ ����
PreparedStatement pstate = null;

//�����ų SQL������ ������ ������ ���´�.
String sql = "select * from members where id=? and pwd=?";

//����Ŭ DBMS�� ������ �� ����� ����̹� ����
Class.forName("oracle.jdbc.OracleDriver");

//������ DBMS(����Ŭ)�� ���� �ʼ� ���� ����
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String db_id = "test";
String db_pwd = "1234";

//���� ������ �̸� �غ��س��� ������ �̿��Ͽ� DBMS�� �����Ѵ�.
//conn�̶�� ������(Connection��ü) ���������� �������.
conn  = DriverManager.getConnection(url, db_id, db_pwd);

//sql�̶�� ������ ����� SQL������ �����ų �غ� �Ѵ�.
pstate = conn.prepareStatement(sql);
pstate.setString(1, id);
pstate.setString(2, pwd);

//select���� �����Ű�� ��ȯ�Ǵ� record���� rs1�� ��´�.
ResultSet rs1 = pstate.executeQuery();
//rs1.next();
//System.out.println(rs1.getString("id"));
String result;
if( rs1.next() ){
	System.out.println(rs1.getString("id"));
	Cookie token1 = new Cookie("sessToken", id);//��Ű ����
	response.addCookie(token1);//��Ű �߱�
	result = "login success";
	System.out.println(result);
	response.sendRedirect("index.jsp"); //������������ ���𷺼�
}
else {
	System.out.println(rs1.getString("id"));
	result = "login failed";
	System.out.println(result);
}

%>
</body>
</html>