<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/assets/css/notice.css" rel="stylesheet" />
<script defer type="text/javascript" src="/resources/assets/js/noticeModify.js"></script>
<meta charset="UTF-8" />
</head>
<body>
<%
      pageContext.setAttribute("crcn", "\r\n");
      pageContext.setAttribute("br", "<br>"); 
%> 
	<section id="noticeF">
		<div class="container">
			<h3>게시글 수정하기</h3>
		</div>

		<div class="container" style="text-align: left; width: 700px">
			<form role="form" action="/admin/notice/modifypro.toy" method="post"
				encType="multipart/form-data">

				<input type="hidden" value="${modify.n_num}" name="n_num">

				<div class="form-group" style="margin-bottom: 30px;">
					<p style="font-weight: bold;">제목</p>
					<input class="form-control" name="n_title"
						value='<c:out value="${modify.n_title}"/>'>
				</div>

				<div class="form-group" style="margin-bottom: 20px;">
					<p style="font-weight: bold;">내용</p>
					<textarea rows="13" class="form-control" rows="3"
						id="textArea_byteLimit" name="n_content"
						onkeyup="fn_checkByte(this)"><c:out
							value="${fn:replace(modify.n_content,br,crcn)}" /></textarea>
					<sup>(<span id="nowByte">0</span>/1400bytes)
					</sup>
				</div>
				<div style="margin-bottom: 20px;">
					<p>
						<c:set var="optionArr" value="${fn:split(modify.f_svname,',')}"></c:set>
						<c:if test="${modify.f_svname != null}">
							<p style="font-weight: bold;">기존 이미지(삭제할 이미지를 체크해주세요)</p>
							<c:forEach begin='0' end='${fn:length(optionArr)}'
								items="${optionArr}" varStatus='status'>
								<div style="text-align: center;">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/image/${optionArr[status.index]}"
										style="width: 90%; height: auto;" />&nbsp;&nbsp;&nbsp;
									<input id="input2" class="check" type="checkbox" name="item" style="width: 20px; height: 20px;"
										value="${optionArr[status.index]}"><br /> <br />
								</div>
							</c:forEach>

							<div id="fileDiv"
								style="text-align: left; margin-top: 20px; margin-left: 20px;">
								<span><input type="file" id="file" name="file_0">
									<a href="#this" class="btn" id="delete" name="delete"
									style="font-size: 13px;">삭제</a> <a href="#this" class="btn"
									id="addFile" style="font-size: 13px;">파일 추가</a></span>
							</div>
						</c:if>
					</p>
				</div>

				<c:if test="${modify.f_svname == null}">
					<div class="form-group">
						<div id="fileDiv" style="text-align: left;">
							<span><input type="file" id="file" name="file_0">
								<a href="#this" class="btn" id="delete" name="delete">삭제</a> <a
								href="#this" class="btn" id="addFile">파일 추가</a></span>
						</div>
					</div>
				</c:if>

				<div style="margin-top: 40px; text-align: center;">
					<button type="submit" class="btn-book-a-table"
						style="border: 0; margin-right: 10px;" id="deleteButton">수정</button>
					<button type="button" data-oper='list' id="cancel"
						class="btn-book-a-table" style="border: 0">취소</button>
				</div>
			</form>
		</div>
	</section>
</body>
</html>