<%@page import="java.sql.SQLSyntaxErrorException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
//request��ü�� �ӽ� ����Ǿ� �ִ� �Ķ���͵��� ������ �����ؼ� �Ű� ��´�.
String id = request.getParameter("id") + "         "   ;

//DB���� ������ ���� ���� ����
Connection conn = null;

//SQL���� �����ų �۾� ������ ����
PreparedStatement pstate1 = null;

//�����ų SQL������ ������ ������ ���´�.
String sql = "delete from members where id = ? ";

//����Ŭ DBMS�� ������ �� ����� ����̹� ����
	Class.forName("oracle.jdbc.OracleDriver");

//������ DBMS(����Ŭ)�� ���� �ʼ� ���� ����
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String db_id = "test";
String db_pwd = "1234";

//���� ������ �̸� �غ��س��� ������ �̿��Ͽ� DBMS�� �����Ѵ�.
//conn�̶�� ������(Connection��ü) ���������� �������.
	conn  = DriverManager.getConnection(url, db_id, db_pwd);

// sql�̶�� ������ ����� SQL������ �����ų �غ� �Ѵ�.
	pstate1 = conn.prepareStatement(sql);


//SQL������ �ϼ����� ���� ������ �ְ�(?ǥ��) ���⿡ ������ ���� �������ش�.
pstate1.setString(1, id);

//pstate1 �̶�� ������ ������ �����ų SQL ������ �غ�Ǿ� �ְ� �̸� ������.
	int ret = pstate1.executeUpdate();
	System.out.println("ret="+ret);


//conn.commit();

%>
</body>
</html>