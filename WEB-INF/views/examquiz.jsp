<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions List</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
input[type=radio] {
	display: none;
}

label {
	display: block;
	width: 120px;
	border: 2px solid green;
	text-align: center;
	border-radius: 8px;
	padding: 8px;
	float: right;
}

input[type=radio] ~ label {
	background-color: white;
	color: black;
}

input[type=radio]:checked ~ label {
	background-color: green;
	color: white;
}

.dropbtn {
	background-color: #007bff;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	max-height: 200px;
	overflow: scroll;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #007bff;
}

.attempted:after {
	content: ' \2611';
}

.notAttempted:after {
/* 	content: ' \2610'; */
}

#reviewQuestions {
	overflow-y: scroll;
	height: 575px;
}
</style>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/bootstrap.js"></script>
<script>
	
let max=30*60; //30minutes
if(sessionStorage.getItem("max")!=null){
	max=sessionStorage.getItem("max");
}
window.onload=function(){	
	setInterval(()=>{
		let time=parseInt($("#time").html());
		$("#time").html(time+1);
		$("#ntime").val(time+1);
	},1000);
	setInterval(()=>{
		max--;
		let x=converttotime(max);
		$("#max").html(x);	
		sessionStorage.setItem("max",max);
		$("#nmax").val(max);
	},1000);
};
function finishnow(){
	console.log("finish run");
	sessionStorage.removeItem("max");
}
function gotoQ(qid)
{
	const form = document.getElementById('examForm');
	const hiddenField = document.createElement('input');
    hiddenField.type = 'hidden';
    hiddenField.name = 'gotoQ';
    hiddenField.value = qid;
    form.appendChild(hiddenField);	
	form.submit();
	
}
function converttotime(num){
	let min=Math.floor(num/60);
	let sec=num%60;
	return pad(min,2)+":"+pad(sec,2);
}
function pad(num, size) {
    num = num.toString();
    while (num.length < size) num = "0" + num;
    return num;
}
function allowOnlyLetters(e, t)   
{    
   if (window.event)    
   {    
      var charCode = window.event.keyCode;    
   }    
   else if (e)   
   {    
      var charCode = e.which;    
   }    
   else { return true; }    
   if (charCode > 64 && charCode < 69)   
       return true;    
   else  
   {    
      alert("Please enter only A, B, C or D");    
      return false;    
   }           
}
/* function reviewQ()
{
	isReviewButtonPressed=true;
	const reviewQuestions = document.getElementById('reviewQuestions');
	reviewQuestions.style.visibility = "visible";
	const goToQDiv = document.getElementById('goToQDiv');
	goToQDiv.style.visibility = "visible";
	document.getElementById('isReviewButtonPressed').value=true;
	
	} */

</script>
</head>
<body>
	<div class="container-fluid mt-4">
		<c:if test="${msg ne null }">
			<div class="alert alert-success text-center">${msg }</div>
		</c:if>
		<div class="row">
		<div class="col-4">
		<div class=" float-left">
						<img src="images/dprlg.png" class="img-thumbnail rounded-circle"
							style="width: 100px;">
					</div></div>
		<div class="col-5">
		<h4 class="p-2 text-center">Spatial Skill Test</h4></div>
		<div class="col-3">
		<h4 class="float-right p-2">${sessionScope.user.uname }</h4></div>
		</div>
		<div class="row">
		<div class="col-9">
		<div class="card shadow">
			<div class="card-body" >
				<h4>Question ${sessionScope.id } of ${sessionScope.total }</h4>
				<form method="post" id="examForm">
					<input type="hidden" name="qid" value="${q.id }"> <input
						type="hidden" name="time" id="ntime" value="${ex.time }">
					<input type="hidden" name="userid"
						value="${sessionScope.user.userid }">
					<h5 class="p-2">Q ${q.question }</h5>
					<div style="text-align: center;">

						<img src="${q.qpic }" style="width: 100%; height: 100%;"
							class="border">
					</div>
					<div class="row my-3" style="justify-content: center;">
						<h5 class="p-2">Type your answer here:</h5>
						<input type="text" name="uans"
							onkeypress="return allowOnlyLetters(event,this);" maxlength="1"
							value="${ex.uans}" style="width:50px;text-align: center;" autocomplete="off"/>
					</div>
					<!-- <input type="hidden" name="isReviewButtonPressed"/>
					<c:choose>
					<c:when test="${isReviewButtonPressed}">
					<div id="goToQDiv" class="dropdown">
						<button class="dropbtn">Go to Question No.</button>
						<div class="dropdown-content">
							<c:forEach items="${qids}" var="qid">
								<a href="#" onClick="gotoQ(${qid})">${qid}</a>
							</c:forEach>
						</div>
					</div>
					
					</c:when>
					<c:otherwise>
					<div id="goToQDiv" class="dropdown" style="visibility: hidden">
						<button class="dropbtn">Go to Question No.</button>
						<div class="dropdown-content">
							<c:forEach items="${qids}" var="qid">
								<a href="#" onClick="gotoQ(${qid})">${qid}</a>
							</c:forEach>
						</div>
					</div>
					
					
					</c:otherwise>
					</c:choose> -->
					
					
					<div class="clearfix"></div>
					<br>
					<c:if test="${sessionScope.id ne sessionScope.total }">
						<button class="btn btn-primary float-right ml-2" name="next">Next</button>
					</c:if>
					<c:if test="${sessionScope.id eq sessionScope.total }">
						<!-- <input type="button" class="btn btn-primary float-right ml-2"
							name="review" value="Review" onclick="reviewQ()">  -->
						<button class="btn btn-primary float-right ml-2" name="finish"
							onclick="finishnow()">Finish</button>

					</c:if>
					<c:if test="${not first and sessionScope.id>1}">
						<button class="btn btn-primary float-right ml-2" name="prev">Previous</button>
					</c:if>
					<!-- <div id="reviewQuestions">
						<table id="reviewQuestionTable"
							class="table table-bordered table-striped"
							style="max-width: 200px; overflow-x: auto;">
							<thead class="table-primary">
								<tr>
									<th>Question</th>

									<c:forEach items="${listOfQuestions}" var="ques">
										<th>${ques.qid }</th>
									</c:forEach>
								</tr>
							</thead>
							<tr>
								<th>Attempt status</th>
								<c:forEach items="${listOfQuestions}" var="ques">
									<th><c:if test="${not empty ques.uans }">
											<span class="attempted"></span>
										</c:if> <c:if test="${ empty ques.uans }">
											<span class="notAttempted"></span>
										</c:if></th>
								</c:forEach>
							</tr>
						</table>
					</div> -->
				</form>
				<div style="visibility: hidden">
					<h4 class="p-2 border text-center">
						Time Remaining : <span id="max"></span>
					</h4>
					<span id="time" class="text-white">${ex.time }</span>
				</div>
			</div>
		</div>
		</div>

<div class="col-3">
		<div class="card shadow ">
		<div id="reviewQuestions" class="card-body">
						<table id="reviewQuestionTable"
							class="table table-bordered table-striped"
							style="max-height: 500px; overflow-y: auto;">
							<thead class="table-primary">
								<tr>
									<th>Question</th>
									<th>Attempt status</th>
								</tr>
								</thead>
								
									<c:forEach items="${listOfQuestions}" var="ques">
										<tr>
										<th><a href="javascript:gotoQ(${ques.qid});" >${ques.qid }</a></th>
										<th><c:if test="${not empty ques.uans }">
											<span class="attempted"></span>
										</c:if> <c:if test="${ empty ques.uans }">
											<span class="notAttempted"></span>
										</c:if></th>
										</tr>
										
									</c:forEach>
													</table>
					</div></div>
	
</div>

		</div>
	</div>

</body>
</html>
