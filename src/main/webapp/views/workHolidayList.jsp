<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>연차/휴가 관리</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

</head>
<body>
<jsp:include page = "index.jsp"></jsp:include>
<!-- Site wrapper -->
<div class="wrapper">
  <div class="content-wrapper">
    <section class="content-header">
            <h1>연차/휴가 관리</h1>         
    </section>
    <br/>
    <!-- Main content -->
    <section class="content">
    	<br/>
    	<table class="table table-bordered">
	   		<thead>
	   			<tr>
	   				<th>아이디</th>
	   				<th>총 연차 갯수</th>
	   				<th>사용 연차</th>
	   				<th>잔여 연차</th>
	   				<th>발생 년도</th>			
	   			</tr>    		
	   		</thead>
	   		<tbody>	  			
				<tr>
	   				<td>${annual_leave.member_id}</td>
	   				<td>${annual_leave.annual_cnt}</td>
	   				<td>${annual_leave.use_cnt}</td>
	   				<td>${annual_leave.left_cnt}</td>
	   				<td>${annual_leave.year}</td>  				
	   			</tr>
	   		</tbody>    	
	   	</table>    	
	    <br/>
	    <b>연차 사용/등록 내역</b>
	    <table class="table table-bordered">
	   		<thead>
	   			<tr>
	   				<th>신청일</th>
	   				<th>승인자</th>
	   				<th>연차 시작일</th>			
	   				<th>연차 종료일</th>
	   				<th>사용 일 수</th>
	   				<th>연차 사유</th>
	   				<th>연차 유형</th>
	   				<th>승인 여부</th>
	   			</tr>    		
	   		</thead>
	   		<tbody>
	   			<c:if test="${leave_recode_List eq null}">
					<tr>
						<th colspan="9">등록된 연차/휴가 내역이 없습니다.</th>
					</tr>
				</c:if>   		
	    		<c:forEach items="${leave_recode_List}" var="leave_recode_List">
					<tr> 
	    				<td>${leave_recode_List.regist_date}</td>
	    				<td>${leave_recode_List.approval_id}</td>
	    				<td>${leave_recode_List.start_date}</td>
	    				<td>${leave_recode_List.end_date}</td>
	    				<td>${leave_recode_List.use_cnt}</td>
	    				<td>${leave_recode_List.reason}</td> 
	    				<td>${leave_recode_List.type}</td> 
	    				<td>${leave_recode_List.approval}</td>
	    			</tr>			
				</c:forEach>				
	   		</tbody>    	
	   	</table>
    </section>
  </div>
</div>
<!-- ./wrapper -->
<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>
