
                            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                            <%@ include file="includes/header.jsp"%>

                            <div id="page-wrapper">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <h1 class="page-header">수정하기</h1>
                                    </div>
                                    <!-- /.col-lg-12 -->
                                </div>
                                <!-- /.row -->
                                <div class="row">
                                    <div class="col-lg-12">



                                        <p class="panel panel-default">
                                        <div class="panel-heading">
                                            수정할 내용을 입력해주세요.
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-6">

                                                    <form method="post" enctype="multipart/form-data">

                                                        <div class="form-group">
                                                            <label>제목</label>
                                                            <input class="form-control" value="${board.title}" name="title">
                                                        </div>

                                                        <div class="form-group">
                                                            <label>내용</label>
                                                            <input class="form-control" placeholder="Enter text" name="cnt" value="${board.cnt}">
                                                        </div>

                                                       


                                                        <button>수정</button>
                                                        
                                                        <input type='file' name='addfile' multiple="multiple">
                                                    </form>

                                                </div>
                                            </div>
                                            <!-- /.panel-body -->
                                        </div>


                                        <form action = "/user/board/remove" method="POST" style="float:left;">
                                            <input type="hidden" name="bno" value="${board.bno}">
                                            <button> 삭제 </button>
                                        </form>

                                        <a href="list?page=${page}"><button> 취소 </button></a>

                                    </div>


<%@ include file="includes/footer.jsp"%>