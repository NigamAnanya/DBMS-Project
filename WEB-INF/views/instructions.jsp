<!DOCTYPE html>
<html>
<head>
<title>Instructions</title>
<link href="css/bootstrap.css" rel="stylesheet">
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
	<div class="container-fluid">
		<div class="card shadow mt-2 mx-auto"
			style="min-height: 90vh; max-width: 80%;">
			<div class="card-title text-center">
				<img src="images/dprlg.png"
					class="img-thumbnail rounded-circle mt-2" style="width: 100px;">
			</div>
			<div class="card-body">
				<h5 class="p-2 float-right">Hi! ${sessionScope.user.uname }</h5>
				<h4 class="text-center p-2" style="border-bottom: 2px solid green;">Instructions</h4>
				<ol>
					<li>1.	This is a test of spatial abilities. You would be presented questions 
						on the computer one question at a time in which a logic of sequence, series, 
						mental rotation etc. shall be applied to arrive at answer. You are required 
						to record the answer by selecting the alternative from options A, B, C, D shown
						 on the screen below the problem figure. For example, if B the correct answer, 
						then you have to type your Answer in the box on your computer screen.This test comprises of
                                                 Objective type Multiple Choice Questions (MCQs) </li>
					<li>You are required to answer all the questions.</li>

					<li>All questions are compulsory and each carries equal mark. </li>
					<li>There will be NO NEGATIVE MARKING for the wrong answers</li>
					<li>Do not maximise or minimise the browser window during the online
						exam.</li>
					<li>Do not close the browser during the test before your exam
						is complete.</li>
					<li>Do not click the 'BACK' button of browser during exam.</li>
					<li>After finishing the exam, click on the PRE-CONFIRM button
						at the bottom of the browser page.</li>
					<li>Once submitted, a message shall be displayed "Your test 
						has been submitted successfully" and you can logout from the
						candidate online portal.</li>
				</ol>

				<h4 class="text-center p-2">===== All the best =====</h4>
				<div class="text-center">
					<a href="/Online-Examination-2.5.5/logout" target="blank" class="btn btn-danger"
						style="width: 200px; margin-top: 70px;">Exit</a> <a href="/Online-Examination-2.5.5/Start"
						 class="btn btn-success"
						style="width: 300px; margin-top: 70px;">I have read & understood the
						instructions</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

