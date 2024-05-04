<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions List</title>
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
	<div class="container-fluid mt-4">
		<c:if test="${msg ne null }">
			<div class="alert alert-success text-center">${msg }</div>
		</c:if>
		<h4 class="p-2 text-center">Questions List</h4>
		<div class="form-row">
			<c:forEach items="${list }" var="q">
				<div class="col-sm-6">
					<div class="card shadow mb-1">
						<div class="card-body px-auto py-auto">
							<h5 class="p-2">Q${ q.id}. ${q.question }</h5>
							<img src="${q.qpic }" style="width: 100%; height: 120px;"
								class="border">
							<h5 class="p-2 float-right">Answer: ${q.cans }</h5>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>