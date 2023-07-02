<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<style>
	#btn{
		width: 70px;
		height: 35px;
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
	}
	#but button{
		border: 1px solid #20c997;
		background-color: rgba(0,0,0,0);
		color: #20c997;
		padding: 5px;
	}
	#but button:hover{
		color: white;
		background-color: #20c997;
	}
	.dept, .job, .status, .admin{
		border-radius: 4px;
		float: right;
		border: 1px solid black;
		background-color: rgba(0,0,0,0);
		padding: 1px;
	}
</style>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Projects</title>

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
            <h1>관리자 회원 상세보기</h1>         
    	</section>
    	<!-- Main content -->
	    <section class="content">
	    	<form action="MemberUpdate.go" method="post">
	    		<input type="hidden" name="id" value="${detail.id}">
				<table class="table table-bordered">
					<tr>
						<th>사진</th>
					</tr>
					<tr>
						<td>사진 넣어야함</td>
					</tr>
				</table>
				<table class="table table-bordered">
					<tr>
						<th colspan="5">기본 정보</th>
					</tr>
					<tr>
						<td>이름 : &nbsp;&nbsp;&nbsp;&nbsp; ${detail.name}</td>
						<td>아이디 : &nbsp;&nbsp;&nbsp;&nbsp; ${detail.id}</td>
						<td>생년월일 : &nbsp;&nbsp;&nbsp;&nbsp; ${detail.birth_date}</td>
						<td>이메일 :&nbsp;&nbsp;&nbsp;&nbsp; ${detail.email}</td>
						<td>연락처 :&nbsp;&nbsp;&nbsp;&nbsp; ${detail.phone}</td>
					</tr>
				</table>
				<table class="table table-bordered">
					<tr>
						<th colspan="4">관리자</th>
					</tr>
					<tr>
						<td>
						    관리자 설정 : &nbsp;&nbsp;&nbsp;&nbsp; ${detail.admin_chk}
						    <select class="admin" name="admin">
							    <option value="0">사원</option>
							    <option value="1">관리자</option>
							</select>
						</td>
						<td>직급 기록 : <a href="#">직급 기록 연결해야함</a></td>
						<td>부서 기록 : <a href="#">부서 기록 연결해야함</a></td>
						<td>근태 기록 : <a href="#">근태 기록 연결해야함</a></td>
					</tr>
				</table>
				<table class="table table-bordered">
					<tr>
						<th colspan="5">인사 정보</th>
					</tr>
					<tr>
						<td>입사일 : &nbsp;&nbsp;&nbsp;&nbsp; ${detail.hire_date}</td>
						<td>
							부서 : &nbsp;&nbsp;&nbsp;&nbsp; ${detail.dept_name}
							<select name="dept" class="dept">
							    <option value="총무팀">총무팀</option>
								<option value="촬영팀">촬영팀</option>
								<option value="편집팀">편집팀</option>
								<option value="기획팀">기획팀</option>
							</select>
						</td>
						<td>
							직급 : &nbsp;&nbsp;&nbsp;&nbsp; ${detail.job_name}
							<select name="job" class="job">
								<option value="사원" >사원</option>
								<option value="대리" >대리</option>
								<option value="팀장" >팀장</option>
								<option value="대표이사" >대표이사</option>
							</select>
						</td>
						<td>
							계정 상태 : &nbsp;&nbsp;&nbsp;&nbsp; ${detail.status}
							<select name="status" class="status">
								<option value="재직">재직</option>
								<option value="휴직">휴직</option>
								<option value="퇴사">퇴사</option>
							</select>
						</td>
						<td>퇴사일 : &nbsp;&nbsp;&nbsp;&nbsp; ${detail.end_date}</td>
					</tr>
				</table>
				<div id="but">
					<button id="btn" type="submit">완료</button>
				</div>
			</form>	
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
	// 부서 값 가져오기
	var deptValue = '${detail.dept_name}'; // 부서 값 가져오기
	var deptSelect = document.querySelector('.dept'); // 부서 셀렉트 요소 가져오기
	
	// 부서 값에 따라 기본값 설정
	for (var i = 0; i < deptSelect.options.length; i++) {
	    if (deptSelect.options[i].value === deptValue) {
	        deptSelect.options[i].selected = true;
	        break;
	    }
	}
	var jobValue = '${detail.job_name}'; // 직급 값 가져오기
	console.log('jobValue:', jobValue); // 로그 출력

	var jobSelect = document.querySelector('.job'); // 직급 셀렉트 요소 가져오기

	// 직급 값에 따라 기본값 설정
	for (var j = 0; j < jobSelect.options.length; j++) {
	    if (jobSelect.options[j].value === jobValue) {
	        jobSelect.options[j].selected = true;
	        break;
	    }
	}
	// 계정 상태 값 가져오기
	var statusValue = '${detail.status}';
	var statusSelect = document.querySelector('.status'); // 계정 상태 셀렉트 요소 가져오기

	// 계정 상태 값에 따라 기본값 설정
	for (var k = 0; k < statusSelect.options.length; k++) {
	    if (statusSelect.options[k].value === statusValue) {
	        statusSelect.options[k].selected = true;
	        break;
	    }
	}
	// 관리자 설정 값 가져오기
	var adminValue = '${detail.admin_chk}';
	var adminSelect = document.querySelector('.admin'); // 관리자 설정 셀렉트 요소 가져오기

	// 관리자 설정 값에 따라 기본값 설정
	if (adminChkValue === true) {
	    adminSelect.options[1].selected = true; // "관리자" 옵션 선택
	} else {
	    adminSelect.options[0].selected = true; // "사원" 옵션 선택
	}
</script>
</html>