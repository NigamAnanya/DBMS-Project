<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
<script>
/* var tableToExcel = (function() {
      var uri = 'data:application/vnd.ms-excel;base64,'
        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
        , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
        , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
      return function(table, name) {
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
        window.location.href = uri + base64(format(template, ctx))
      }
    })()*/
    function ExportToExcel(type, fn, dl) {
        var elt = document.getElementById('consolidatedTable');
        var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
        return dl ?
          XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }):
          XLSX.writeFile(wb, fn || ('MySheetName.' + (type || 'xlsx')));
     }
</script>

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
	<div class="container-fluid mt-4">
		<c:if test="${msg ne null }">
			<div class="alert alert-success text-center">${msg }</div>
		</c:if>
		<h4 class="p-2 text-center">Consolidated Report(Time taken)</h4>

		<table id="consolidatedTable"
			class="table table-bordered table-striped">
			<thead class="table-primary">
				<tr>
					<th>User/ Question ID</th>
					<c:forEach items="${listOfQuestions }" var="u">
						<th>${u.id}</th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listOfUsers }" var="u">
					<tr>
						<th>${u.userid }</th>
						<c:forEach items="${listOfCandidateResponseTime }" var="cr">
							<c:if test="${u.userid == cr.userid }">
								<th>${cr.time }</th>
							</c:if>



						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- <button class="btn btn-primary float-right ml-2" name="exportToExcel"
			onclick="tableToExcel('consolidatedTable', 'Consolidated Report')">Export
			To Excel</button>
			 -->
			<button class="btn btn-primary float-right ml-2" name="exportToExcel"
			onclick="ExportToExcel('xlsx')">Export
			To Excel</button> 
	</div>
</body>