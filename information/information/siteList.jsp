<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="module" src="/resources/js/siteList/siteList.js"></script>

<div class="title-area">
	<h3 class="main-tit">관측소제원</h3>
	<h4 class="sub-tit">관측소 정보</h4>
</div>
<div class="search-area">
	<label for="labelForSel1" class="search-tit minTit">조회항목</label> <select
		id="searchType" name="searchType" class="select-lg bd-lightgray select">
		<option value="name">관측소명</option>
		<option value="addr">관측소 주소</option>
	</select> <input type="text"
		class="input-xl bd-lightgray search" id="searchKeyword" name="searchKeyword"
		value="${searchKeyword}" placeholder="검색어를 입력해주세요.">
	<button type="button" class="btn-sm white search-btn" id="searchButton"
		>검색</button>
		
	<button id="excel" type="button" class="btn-xl bg-white bd-lightgray excel"
		>
		<i class="icon icon-excel"></i><span>엑셀다운로드</span>
	</button>
		<button type="button" class="btn-md bd-blue bg-white blue search-btn" id="insertButton"
			 style="color: #0457ac;">관측소 추가</button>
</div>

<div class="con-box">
	<div class="txt-align-rt">
		<p class="result-data">
			총<strong id="total"></strong>건의 데이터
		</p>
	</div>
	<div class="table-area siteList">
		<div id="siteTableDiv" class="scroll_table_head">
			<table class="tb-default list">
				<colgroup>
					<col style="width: 4%;">
					<col style="width: 7%;">
					<col style="width: 17%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 6%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
				</colgroup>
				<thead>
					<tr>
						<th class="bg-lightgray col5">순번</th>
						<th class="bg-lightgray">관측소명</th>
						<th class="bg-lightgray">주소</th>
						<th class="bg-lightgray">설치일자</th>
						<th class="bg-lightgray">운영현황</th>
						<th class="bg-lightgray">표고</th>
						<th class="bg-lightgray">케이싱구경</th>
						<th class="bg-lightgray">굴착깊이</th>
						<th class="bg-lightgray">지하수 용도</th>
						<th class="bg-lightgray">음용여부</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="userTableDiv" class="scroll_table_body scroll-theme" data-mcs-theme="dark" style="height:650px; overflow:auto">
			<table id="userTable"  class="tb-default list">
				<colgroup>
					<col style="width: 4%;">
					<col style="width: 7%;">
					<col style="width: 17%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 6%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
				</colgroup>
				<thead>
					<tr>
						<th class="bg-lightgray col5">순번</th>
						<th class="bg-lightgray">관측소명</th>
						<th class="bg-lightgray">주소</th>
						<th class="bg-lightgray">설치일자</th>
						<th class="bg-lightgray">운영현황</th>
						<th class="bg-lightgray">표고</th>
						<th class="bg-lightgray">굴착구경(mm)</th>
						<th class="bg-lightgray">굴착심도(m)</th>
						<th class="bg-lightgray">운영현황</th>
						<th class="bg-lightgray">지하수 용도</th>
						<th class="bg-lightgray">음용 여부</th>
					</tr>
				</thead>
				<tbody id="tBody">
				</tbody>
			</table>
		</div>
	</div>
</div>

 <sec:authorize access="hasRole('ROLE_ADMIN')">
	<!-- 관측소 추가 창 -->
	<div data-pop-window="siteInsert"
		class="layer-pop siteAddForm siteForm" id="pageNone" style="display: none;">
		<button type="button" class="close-btn pop-close"></button>
		<div class="form-logo">
			<img src="/sgms/images/main/login_logo.png" alt="소다모니터링시스템">
		</div>
		<strong class="login-title">관측소 추가</strong>
			<table class="tb-site">
				<tbody>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">관측소
								이름</label></th>
						<td><input name="obsvNm" type="text"
							class="siteAddForm-input obsvNm" id="obsvNm"></td>
						<th><label for="labelForId" class="siteAddForm-name">관측소
								코드</label></th>
						<td><input name="obsvCd" type="text"
							class="siteAddForm-input obsvCd" id="obsvCd"></td>
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">관측소 주소</label></th>
						<td colspan="4"><div class="stdgCd">			
						</div></td>
						
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">관측소
							시리얼번호</label></th>
						<td><input name="obsvSn" type="text"
							class="siteAddForm-input obsvSn" id="obsvSn"></td>
							
							<th><label for="labelForId" class="siteAddForm-name">상세
							주소</label></th>
						<td><input name="addr" type="text"
							class="siteAddForm-input addr" id="addr"></td>
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">경도</label></th>
						<td><input name="lot" type="text"
							class="siteAddForm-input lot" id="lot"></td>
						<th><label for="labelForId" class="siteAddForm-name">위도</label></th>
						<td><input name="lat" type="text"
							class="siteAddForm-input lat" id="lat"></td>
					</tr>

					<tr>
						<th><label for="labelForId" class="siteAddForm-name">사용용도</label></th>
						<td>
							<!-- 									<input name="wSrv" type="text" class="siteAddForm-input" id="wSrv"> -->
							<select name="useType" class="userForm-select useType" id="useType">
								<option value="농업용">농업용</option>
								<option value="어업용">어업용</option>
								<option value="공업용">공업용</option>
								<option value="생활용">생활용</option>
								<option value="기타용">기타용</option>
						</select>
						</td>
						<th><label for="labelForId" class="siteAddForm-name">굴착깊이(m)</label></th>
						<td><input name="digDepth" type="text"
							class="siteAddForm-input digDepth" id="digDepth"></td>			
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">사용여부</label></th>
						<td>
							<!-- 									<input name="siteOper" type="text" class="siteAddForm-input" id="siteOper"> -->
							<select name="useYn" class="userForm-select useYn" id="useYn">
								<option value="N">N</option>
								<option value="Y">Y</option>
						</select>
						</td>
						<th><label for="labelForId" class="siteAddForm-name elev">표고</label></th>
						<td><input name="elev" type="text" class="siteAddForm-input"
							id="elev"></td>
						
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">음용여부</label></th>
						<td>
							<!-- 									<input name="wDrinkYn" type="text" class="siteAddForm-input" id="wDrinkYn"> -->
							<select name="drkYn" class="userForm-select drkYn" id="drkYn">
								<option value="N">N</option>
								<option value="Y">Y</option>
						</select>
						</td>
								<th><label for="labelForId" class="siteAddForm-name">설치일자
								</label></th>
						<td><input name="instlYmd" type="text"
							class="siteAddForm-input instlYmd" id="instlYmd"></td>
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">운영현황</label></th>
						<td>
							<!-- 									<input name="siteOper" type="text" class="siteAddForm-input" id="siteOper"> -->
							<select name="operYn" class="userForm-select operYn" id="operYn">
								<option value="N">N</option>
								<option value="Y">Y</option>
						</select>
						</td>
						<th><label for="labelForId" class="siteAddForm-name">케이싱구경(m)</label></th>
						<td><input name="csiDia" type="text"
							class="siteAddForm-input csiDia" id="csiDia"></td>
					</tr>
						<tr>
						<th><label for="labelForId" class="siteAddForm-name">
							비고</label></th>
						<td colspan="4"><input name="doc" type="text"
							class="siteAddForm-input doc" id="doc"></td>
					</tr> 
					<!-- <tr>
						<th><label for="labelForId" class="siteAddForm-name">비고</label></th>
						<td><input name="wRem" type="text" class="siteAddForm-input"
							id="wRem"></td>
					</tr> -->
				</tbody>
			</table>
			<!--
					<div class="row">
						<label for="labelForId" class="siteAddForm-name">아이디</label>
						<input name="userId" type="text" class="siteAddForm-input" id="loginId" readonly="readonly">
					</div>
					<div class="row">
						<label for="labelForId" class="siteAddForm-name">이름</label>
						<input name="name" type="text" class="siteAddForm-input" id="loginName" >
					</div>
					<div class="row">
						<label for="labelForId" class="siteAddForm-name">소속</label>
						<input name="dept" class="siteAddForm-select" id="dept">
					</div>
					<div class="row">
						<label for="labelForId" class="siteAddForm-name">전화번호</label>
						<input name="tel" type="text" class="siteAddForm-input" id="loginTel">
					</div>
					<div class="row">
						<label for="labelForId" class="siteAddForm-name">이메일</label>
						<input name="email" type="text" class="siteAddForm-input" id="loginEmail">
					</div>
					<div class="row">
						<label for="labelForid6" class="siteAddForm-name">프로젝트 권한</label>
						<select name="managerName" onchange="MCode()" class="siteAddForm-select" id="loginManagerName">
						</select>
					</div>
					<div class="row">
						<label for="labelForId" class="siteAddForm-name">프로젝트 코드</label>
						<input name="managerCode" type="text" class="siteAddForm-input" id="loginManagerCode" readonly="readonly">
					</div>
					<div class="row">
						<label for="labelForid7" class="siteAddForm-name">사용여부</label>
						<select name="enabled" id="labelForid7" class="siteAddForm-select">
							<option value="1">활성화</option>
							<option value="0">비활성화</option>
						</select>
					</div>
					-->
			<div class="btn-area txt-align-ct mt20">
				<button type="button" class="btn-xl bd-blue bg-blue white" id=siteInsertButton>
				추가</button>
				<!-- 						<button type="button" class="btn-xl bd-blue bg-blue white" onclick="siteInsert();">추가</button> -->
				<button type="button" class="btn-xl bd-blue bg-white blue pop-close close" id="cancelButton">취소</button>
			</div>
	</div>
</sec:authorize> 