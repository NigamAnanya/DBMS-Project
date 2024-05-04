<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spatial Skill Test</title>
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
		<h4 class="p-2 text-center">User List</h4>
		<table class="table table-bordered table-striped">
			<thead class="table-primary">
				<tr>
					<th>User ID</th>
					<th>User Name</th>
					<th>Gender</th>
					<th>Password</th>
					<th>Service/Student</th>
					<th>Status</th>
					<th>Result</th>
					<th>Registration Date</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="u">
					<tr>
						<th>${u.userid }</th>
						<th>${u.uname }</th>
						<th>${u.gender}</th>
						<th>${u.pwd }</th>
						<th>${u.utype }</th>
						<th>${u.status }</th>
						<th>${u.result }</th>
						<th>${u.createdon }</th>
						<td><c:if test="${u.result ne null }">
								<a href="/Online-Examination-2.5.5/report?userid=${u.userid }"
									class="btn btn-primary btn-sm">Exam Report</a>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>