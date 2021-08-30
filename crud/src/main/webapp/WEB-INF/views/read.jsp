<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<title>Read Board</title>
</head>
<body>
<!-- 게시글 내용 table -->
<div class="container">
<button class="btn btn-dark float-right my-1" onclick="location.href='/board/post'">Write</button>
		<table class="table table-bordered">
		<thead>
   		<tr> 
   			<th scope="col">Title</th>
   			<td width="flex" colspan="3">${board.title}</td>
   		</tr>
		<tr> 
   			<th scope="row">Writer</th>
   			<td width="flex">${board.writer}</td>
   			<th scope="row">Date</th>
   			<td width="flex">${board.regDate}</td>
   		</tr>
   		<tr> 
   			<th scope="col" colspan="4">Content</th>
   		</tr>
   		<tr height="400">
   			<td width="flex" style="word-break:break-all" colspan="4">${board.content}</td>
		</tr>
		</thead>
		</table>
	<input type="button" class="btn btn-secondary float-right" onclick="location.href='/board'" value="List"/>
	<input type="button" class="btn btn-primary float-left mx-1" data-toggle="modal" data-target="#updateModal" value="Modify"/>
	<input type="button" class="btn btn-danger float-left" data-toggle="modal" data-target="#deleteModal" value="Delete"/>
</div>

<!-- 비밀번호 입력 모달(게시글 수정) -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
 <div class="modal-dialog modal-dialog-centered" role="document">
  <div class="modal-content">
      <div class="modal-header border-bottom-0">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
	<div class="modal-body">
       <div class="form-title text-center">
		  <h5>게시글을 수정하시겠습니까?</h5>
       </div>
        <div class="d-flex flex-column text-center">
			<p style="color:#0000CD; font-size: small;" > 비밀번호를 입력해주세요. </p>
            <div class="form-group">
			 	<input type="hidden" id="idx" name="idx" value="${board.idx}">
				<input type="password" class="form-control" id="pw" name="pw" placeholder="Enter your password" required/>
            </div>
            	<button type="button" class="btn btn-info btn-block btn-round" id="UpdatePwd" name="UpdatePwd" onclick="fnUpdatePwd()">Confirm</button>
		</div>
	</div>
  </div>
 </div>
</div>

<!-- 비밀번호 입력 모달 (게시글 삭제)-->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
 <div class="modal-dialog modal-dialog-centered" role="document">
  <div class="modal-content">
    <div class="modal-header border-bottom-0">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">×</span>
      </button>
    </div>
    <div class="modal-body">
      <div class="form-title text-center">
		  <h5>게시글을 삭제하시겠습니까?</h5>
      </div>
		<div class="d-flex flex-column text-center">
			 <p style="color:#0000CD; font-size: small;" > 비밀번호를 입력해주세요. </p>
          	  <div class="form-group">
			 	<input type="hidden" id="idx" name="idx" value="${board.idx}">
				<input type="password" class="form-control" id="pwd" name="pw" placeholder="Enter your password" required/>
          	  </div>
         	<button type="button" class="btn btn-info btn-block btn-round" id="deletePwd" name="deletePwd" onclick="fnDeletePwd()">Confirm</button>
		</div>
	</div>
  </div>
 </div>
</div>

<!-- Ajax -->
<script>
	//수정 비밀번호 확인 
	function fnUpdatePwd() {
		let pw = $('#pw').val();
		let idx = $('#idx').val();
		$.ajax({
			type:"POST",
			url:"/check/" + idx,
			data:{pw : pw},
			success:function(data) {
				if (data == 'true'){
					$("#updateModal").modal("hide");
					window.location.href = "/board/post/" + idx;
				}else 
					alert("비밀번호를 확인하세요.")
			}
		})
	}
	//삭제 비밀번호 확인 
	function fnDeletePwd() {
		let pw = $('#pwd').val();
		let idx = $('#idx').val();
		$.ajax({
			type:"POST",
			url:"/check/" + idx,
			data:{pw : pw},
			success:function(data) {
				if (data == 'true'){
					$.ajax({
						type:"DELETE",
						url:"/board/post/" + idx,
						success:function(){
							alert("삭제되었습니다.")
							$("#deleteModal").modal("hide");
							window.location.href = "/board";
						}
					})
				} else 
					alert("비밀번호를 확인하세요.")
			}
		})
	}
</script>
</body>
</html>