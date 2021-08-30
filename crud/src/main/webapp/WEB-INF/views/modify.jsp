<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<title>Modify Board</title>
</head>
<body>

<div class="container">
	<form name="modifyForm" method="post">
	<!-- 자원의 일부 수정  patch method-->
	<input type="hidden" id="method" name="_method" value="patch"/>
		<div class="form-group">
			<input type="hidden" id="idx" name="idx" value="${read.idx}">
			<label for="subject">Title</label>
			<input type="text" class="form-control" id="title" name="title" value="${read.title}">
		</div>
		<div class="form-group"  style="width: 45%; margin-right:10%; float:left">
			<label for="writer">Writer</label>
			<input type="text" class="form-control" id="writer" name="writer" value="${read.writer}" disabled/>
		</div>
		<div class="form-group" style="width: 45%; float:left">
			<label for="pw">Password</label>
			<input type="password" class="form-control" id="pw" name="pw" value="${read.pw}">
		</div>
		<div class="form-group" style="float:center">
			<label for="content">Content</label>
			<textarea class="form-control" id="content" name="content" rows="10">${read.content}</textarea>
			<p><font color="#5a5a5a" size="3">500</font></p> <!-- 잔여 글자수 보여줌 -->
		</div>
			<input type="button" class="btn btn-secondary float-left" onclick="location.href='/board'" value="List"/>
			<input type="button" class="btn btn-primary float-right" onclick="FnModify()" value="Modify"/>
	</form>
</div>

<script>

	function FnModify() { 
		var form = document.modifyForm;

		var idx = $("#idx").val();
		var title = $("#title").val();
		var pw = $("#pw").val();
		var content = $("#content").val();

		var dataObj = new Object();
		dataObj.idx = idx;
		dataObj.title = title;
		dataObj.pw = pw;
		dataObj.content = content; 

		//유효성 검사 
		if(form.title.value.length < 2 || form.title.value.length > 30) {
			alert("제목은 30자 이내로 입력해주세요. (공백 불가)");
 			form.title.select();  //해당 폼으로 커서 이동
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
			type : "PATCH",
			data : JSON.stringify(dataObj),
			url : "/board/post/" + idx,
			contentType: 'application/json; charset=UTF-8',
			success : function(data) {
				alert("수정 되었습니다.");
				window.location.href = "/board/" + idx;
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