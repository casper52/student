<%--
  Created by IntelliJ IDEA.
  User: zzz
  Date: 2018-09-12
  Time: 오후 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="includes/header.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Questions?</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<script>
		function change(obj) {

			var sizeValue = obj.options[obj.selectedIndex].value;
			console.log(sizeValue);
			self.location = "qlist?page=1&size=" + sizeValue;
		}
	</script>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					한꺼번에 <select onchange="change(this)">
						<option value="10" ${pageMaker.pageDTO.size == 10?"selected":""}>10</option>
						<option value="20" ${pageMaker.pageDTO.size == 20?"selected":""}>20</option>
						<option value="50" ${pageMaker.pageDTO.size == 50?"selected":""}>50</option>
						<option value="100" ${pageMaker.pageDTO.size == 100?"selected":""}>100</option>
					</select> 개 리스트 보기
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>QNO</th>
								<th>QUESTION</th>
								<th>REGDATE</th>
								<th>TIME</th>

                        </tr>
                        </thead>
						<tbody>
							<c:forEach var="question" items="${qlist}">
								<tr class="odd gradeX">
									<td>${question.qno}</td>
									<td><c:if test="${question.time > 0}">
											<a href="understand?page=${pageMaker.pageDTO.page}&qno=${question.qno}&mno=${question.mno}">
												${question.question}</a>
										</c:if> <c:if test="${question.time <= 0}">
											<a href="response?page=${pageMaker.pageDTO.page}&qno=${question.qno}&mno=${question.mno}">

												${question.question}</a>
										</c:if>
									<td>${question.regdate}</td>
									<td>${question.time>0 ? "진행중":"종료"}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
			
					<div class="text-center">
						<!-- /.table-responsive -->
						<div class="well">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="qlist?page=${pageMaker.start-1}&size=${pageMaker.pageDTO.size}">Prev</a>
									</li>
								</c:if>

								<c:forEach begin="${pageMaker.start}" end="${pageMaker.end}"
									var="num">
									<li ${pageMaker.pageDTO.page == num?"class='active'":""}><a
										href="qlist?page=${num}&size=${pageMaker.pageDTO.size}">${num}</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next}">
									<li><a
										href="qlist?page=${pageMaker.end+1}&size=${pageMaker.pageDTO.size}">Next</a>
									</li>
								</c:if>
							</ul>
							</div>
						</div>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

	<%@include file="includes/footer.jsp"%>