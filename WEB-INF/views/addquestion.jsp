<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Examination</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
body {
	min-height: 100vh;
	background: linear-gradient(rgba(255, 255, 255, .9),
		rgba(255, 255, 255, 0.8)), url('.png') no-repeat;
	min-height: 100vh;
	background-size: 100% 100%;
}
</style>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container mt-4">
		<c:if test="${msg ne null }">
			<div class="alert alert-success text-center">${msg }</div>
		</c:if>
		<h4 class="p-2 text-center">Add New Question</h4>
		<form method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label>Question</label> <input type="text"
					placeholder="Question text here" required name="question"
					class="form-control">
			</div>
			<div class="form-group form-row">
				<div class="col-sm-2">
					<label for="imgInp"><img src="images/upload.png"
						width="150"></label> <input type="file" required name="qphoto"
						id="imgInp" class="form-control d-none">
				</div>
				<div class="col-sm-10">
					<img src="images/noimg.png" id="img" class="img-responsive w-100"
						style="height: 200px">
				</div>
			</div>
			<div class="form-group">
				<label>Correct Answer</label> <select required name="cans"
					class="form-control">
					<option value="">Select Answer</option>
					<option>A</option>
					<option>B</option>
					<option>C</option>
					<option>D</option>
				</select>
			</div>
			<button class="btn btn-primary float-right">Save Question</button>
		</form>
	</div>
	<script>
imgInp.onchange = evt => {
	  const [file] = imgInp.files
	  if (file) {
	    img.src = URL.createObjectURL(file)
	  }
	}
</script>
</body>
</html>