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
//request객체에 임시 저장되어 있는 파라미터들을 변수를 생성해서 옮겨 담는다.
String id = request.getParameter("id") + "         "   ;

//DB연결 정보를 담을 변수 생성
Connection conn = null;

//SQL문을 실행시킬 작업 공간을 생성
PreparedStatement pstate1 = null;

//실행시킬 SQL구문을 변수에 저장해 놓는다.
String sql = "delete from members where id = ? ";

//오라클 DBMS에 접속할 때 사용할 드라이버 지정
	Class.forName("oracle.jdbc.OracleDriver");

//접속할 DBMS(오라클)에 대한 필수 정보 지정
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String db_id = "test";
String db_pwd = "1234";

//드디어 위에서 미리 준비해놓은 정보를 이용하여 DBMS에 접속한다.
//conn이라는 변수에(Connection객체) 연결정보가 담겨진다.
	conn  = DriverManager.getConnection(url, db_id, db_pwd);

// sql이라는 변수에 저장된 SQL구문을 실행시킬 준비를 한다.
	pstate1 = conn.prepareStatement(sql);


//SQL구문에 완성되지 않은 정보가 있고(?표시) 여기에 실제로 값을 지정해준다.
pstate1.setString(1, id);

//pstate1 이라는 변수에 실제로 실행시킬 SQL 구문이 준비되어 있고 이를 실행함.
	int ret = pstate1.executeUpdate();
	System.out.println("ret="+ret);


//conn.commit();

%>
</body>
</html>