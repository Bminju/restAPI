<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<title>Write Board</title>
</head>
<body>

<div class="container">
<h2>Write Board</h2>
		<form name="writeForm">
		<div>
			<label for="title">Title</label>
			<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요. (30자 이내)" required/>
		</div>
		<div class="form-group"  style="width: 45%; margin-right:10%; float:left">
			<label for="writer">Writer</label>
			<input type="text" class="form-control" id="writer" name="writer" placeholder="작성자 (2~10자 이내)" required/>
		</div>
		<div class="form-group" style="width: 45%; float:left">
			<label for="pw">Password</label>
			<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호 (4~10자 이내)" required/>
		</div>
		<div class="form-group" style="float:center">
			<label for="content">Content</label>
			<textarea class="form-control" id="content" name="content" rows="10" maxlength="500" required/></textarea>
			<p><font color="#5a5a5a" size="3">500</font></p> <!-- 잔여 글자수 보여줌 -->
		</div>
			<input type="button" class="btn btn-secondary float-left" onclick="location.href='/board'" value="List"/>
			<input type="button" class="btn btn-dark float-right" onclick="checkForm()" value="write"/>
		</form> 
</div>

<!-- 유효성 검사  -->
<script>

	function checkForm() {
		var form = document.writeForm;
		var title = $("#title").val();
		var writer = $("#writer").val(); 
		var pw = $("#pw").val();
		var content = $("#content").val();

		var dataObj = new Object();
		dataObj.title = title;
		dataObj.writer = writer;
		dataObj.pw = pw;
		dataObj.content = content;

		if(form.title.value.length < 2 || form.title.value.length > 30) {
			alert("제목은 30자 이내로 입력해주세요. (공백 불가)");
 			form.title.select();  //해당 폼으로 커서 이동
			return false;
		}
		if(form.writer.value.length < 2 || form.writer.value.length > 10) {
			alert("작성자 이름은 2 - 10자 이내로 입력해주세요.");
 			form.writer.select(); 
			return false;
		}
		if(form.pw.value.length < 4 || form.pw.value.length > 10) {
			alert("비밀번호는 4 - 10자 이내로 입력해주세요.");
 			form.pw.select();
			return false;
		}
		if(form.content.value.length < 1) {
			alert("내용을 입력해주세요.");
 			form.content.select();
			return false;
		}
	 	$.ajax({
			type:"POST",
			url:"/board/post",
			data:JSON.stringify(dataObj),
			contentType: 'application/json; charset=UTF-8',
			success:function(res) {
					window.location.href = "/board";
			}
		}) 
	}
	// textarea 실시간 글자수 반영
	$('textarea').keyup(function() {
		var inputLength = $(this).val().length; 
		var remain = 500 - inputLength;
			$('font').html(remain+'/500');
		if(remain>=1 && remain<=50){ //입력 가능한 글자수 50자이하 남은 경우 글자색 변함.
			$('font').css('color', 'red');
		}
		if(remain<1){
			alert("더 이상 입력할 수 없습니다.");
		}
	});
</script>
</body>
</html>
