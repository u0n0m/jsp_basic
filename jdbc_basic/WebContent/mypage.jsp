<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
String error ="Login First!!";
String sessTokenId = "no";
Cookie [] cookies  = request.getCookies();
boolean token_not_found = false;
boolean token_found = false;
for(int i=0; i<cookies.length; i++ ){
	System.out.println("cookie[" + i + "]=" + cookies[i].getName());
	System.out.println("cookie[" + i + "]=" + cookies[i].getValue());
	if(cookies[i].getName().equals("sessToken")){
		%><%=cookies[i].getValue() %><%
		token_found = true;
		sessTokenId = cookies[i].getValue();
	}
	else {
		token_not_found = false;  //sessToken을 못 찾았다...
	}
}
if(token_found == false) {
		// jsp를 중지시킨다. or 로그인페이지로 리디렉션
		response.sendRedirect("login.jsp"); //로그인 페이지로 리디렉션
}

//DB연결 정보를 담을 변수 생성
Connection conn = null;

//SQL문을 실행시킬 작업 공간을 생성
PreparedStatement pstate = null;

//실행시킬 SQL구문을 변수에 저장해 놓는다.
String sql = "select * from members where id=?";

//오라클 DBMS에 접속할 때 사용할 드라이버 지정
Class.forName("oracle.jdbc.OracleDriver");

//접속할 DBMS(오라클)에 대한 필수 정보 지정
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String db_id = "test";
String db_pwd = "1234";

//드디어 위에서 미리 준비해놓은 정보를 이용하여 DBMS에 접속한다.
//conn이라는 변수에(Connection객체) 연결정보가 담겨진다.
conn  = DriverManager.getConnection(url, db_id, db_pwd);

//sql이라는 변수에 저장된 SQL구문을 실행시킬 준비를 한다.
pstate = conn.prepareStatement(sql);
pstate.setString(1, sessTokenId);

//select문을 실행시키고 반환되는 record들을 rs1에 담는다.
ResultSet rs1 = pstate.executeQuery();

String result;
rs1.next();
String name = rs1.getString("name");



%> <%=name %>


</body>
</html>