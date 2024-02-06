<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/siteInfo/siteInfo.js"></script>

<div class="con-box">
	<div class="clear-fix">
		<div class="specification-info-box">
			<p class="tit">관측소 정보</p>
			<table class="tb-default">
				<tbody>
					<tr>
						<th>관측소명</th>
						<td>${list.obsvNm}</td>
						<th>관측소코드</th>
						<td>${list.obsvCd}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="4">${list.addrStdg}</td>
					</tr>
					<tr>
						<th>운영현황</th>
						<td >${list.operYn}</td>
						<th>설치일자</th>
						<td>${list.instlYmd}</td>
					
					</tr>
					<tr>
						<th>관측소 시리얼번호</th>
						<td colspan="4">${list.obsvSn}</td>

					</tr>
					<tr>
						<th>위도</th>
						<td>${list.lat}</td>
						<th>경도</th>
						<td>${list.lot}</td>
					</tr>
					<tr>
						<th>상세 주소</th>
						<td>${list.addr}</td>
						<th>도로명 주소</th>
						<td>${list.rdnAddr}</td>
					</tr>
					<tr>
						<th>사용 여부</th>
						<td>${list.useYn}</td>
						<th>사용 용도</th>
						<td>${list.useType}</td>
					</tr>
					<tr>
						<th>표고</th>
						<td>${list.elev}</td>
						<th>굴착깊이</th>
						<td>${list.digDepth}</td>
					</tr>
					<tr>
						<th>음용여부</th>
						<td>${list.drkYn}</td>
						<th>케이싱구경(m)</th>
						<td>${list.csiDia}</td>
					</tr>
					
						
					<tr>
						<th>비고</th>
						<td colspan="4">${list.doc}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="photo-area">
			<p class="photo-area-tit">관측소사진</p>
			<div class="photo-box">
				<c:if test="${empty result.site_img }">
					<div class="no-image">
						<img src="/sgms/images/sub/no_image.png" alt="이미지없음"> <span
							class="no-image-en">No image</span>
						<p class="no-image-tit">이미지가 없습니다.</p>
					</div>
				</c:if>
				<c:if test="${not empty result.site_img }">
					<img alt="" src="/sgms/images${result.site_img}" alt="관측소이미지"
						class="show-img">
				</c:if>
			</div>
		</div>
	</div>
	<div class="txt-align-rt mt40">
		<button style="width: 160px;" class="btn-md bd-blue bg-blue white" id="returnListPage"
			onClick="location.href='/information/deviceInfo.do?siteCode=${result.site_code }'" >관측장비
			제원 페이지로</button>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button class="btn-md bd-blue bg-blue white"
				id="siteUpdateBtn">관측소 수정</button>
		</sec:authorize>
		<button class="btn-sm bg-white bd-lightgray gray list-btn"
			onClick="location.href='/siteList'">목록</button>
	</div>
</div>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<!-- 관측소 수정 창 -->
	<div data-pop-window="siteUpdate"
		class="layer-pop siteAddForm siteForm"   id="siteUpdatePage" style="display: none;">
		<button type="button" class="close-btn pop-close"></button>
		<div class="form-logo">
			<img src="/sgms/images/main/login_logo.png" alt="소다모니터링시스템">
		</div>
		<strong class="login-title">관측소 수정</strong>
		<!-- <form action="/sgms/siteUpdate.do" method="POST" id="siteForm"
			name="siteForm">
 -->			<table class="tb-site">
				<tbody class="siteTableBody">
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">관측소
								이름</label></th>
						<td><input name="obsvNm" type="text"
							class="siteAddForm-input obsvNm" id="obsvNm" value="${list.obsvNm}"></td>
						<th><label for="labelForId" class="siteAddForm-name">관측소
								코드</label></th>
						<td><input name="obsvCd" type="text"
							class="siteAddForm-input obsvCd" id="obsvCd" value="${list.obsvCd}"></td>
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">관측소 주소</label></th>
						<td colspan="4">
				<!--  <input style="display:none;" name="stdgCdValue" type="text" class="siteAddForm-input" id="stdgCdValue" value="${list.stdgCd}">-->
						<div class="stdgCd" stdgCd="${list.stdgCd}" >			
						</div></td>
						
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">관측소
							시리얼번호</label></th>
						<td><input name="obsvSn" type="text"
							class="siteAddForm-input obsvSn" id="obsvSn" value="${list.obsvSn}"></td>
							
							<th><label for="labelForId" class="siteAddForm-name">상세
							주소</label></th>
						<td><input name="addr" type="text"
							class="siteAddForm-input addr" id="addr" value="${list.addr}"></td>
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">경도</label></th>
						<td><input name="lot" type="text"
							class="siteAddForm-input lot" id="lot" value="${list.lot}"></td>
						<th><label for="labelForId" class="siteAddForm-name">위도</label></th>
						<td><input name="lat" type="text"
							class="siteAddForm-input lat" id="lat" value="${list.lat}"></td>
					</tr>

					<tr>
						<th><label for="labelForId" class="siteAddForm-name">사용용도</label></th>
						<td>
							<input style="display:none;" name="useTypeValue" type="text" class="siteAddForm-input" id="useTypeValue" value="${list.useType}">
							<select name="useType" class="userForm-select useType" id="useType" >
								<option value="농업용" >농업용</option>
								<option value="어업용" >어업용</option>
								<option value="공업용" >공업용</option>
								<option value="생활용" >생활용</option>
								<option value="기타용" >기타용</option>
						</select>
						</td>
						<th><label for="labelForId" class="siteAddForm-name">굴착깊이(m)</label></th>
						<td><input name="digDepth" type="text"
							class="siteAddForm-input digDepth" id="digDepth" value="${list.digDepth}"></td>			
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">사용여부</label></th>
						<td>
					
						<input style="display:none;" name="useYnValue" type="text" class="siteAddForm-input" id="useYnValue"  value="${list.useYn}">
							<select name="useYn" class="userForm-select useYn" id="useYn">
								<option value="N">N</option>
								<option value="Y">Y</option>
						</select>
						</td>
						<th><label for="labelForId" class="siteAddForm-name elev">표고</label></th>
						<td><input name="elev" type="text" class="siteAddForm-input"
							id="elev" value="${list.elev}"></td>
						
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">음용여부</label></th>
						<td>
				<input style="display:none;" name="drkYnValue" type="text" class="siteAddForm-input" id="drkYnValue"  value="${list.drkYn}">
							<select name="drkYn" class="userForm-select drkYn" id="drkYn" >
								<option value="N">N</option>
								<option value="Y">Y</option>
						</select>
						</td>
								<th><label for="labelForId" class="siteAddForm-name">설치일자
								</label></th>
						<td><input name="instlYmd" type="text"
							class="siteAddForm-input instlYmd" id="instlYmd" value="${list.instlYmd}"></td>
					</tr>
					<tr>
						<th><label for="labelForId" class="siteAddForm-name">운영현황</label></th>
						<td>
					<input style="display:none;" name="operYnValue" type="text" class="siteAddForm-input" id="operYnValue" value="${list.operYn}">
							<select name="operYn" class="userForm-select operYn" id="operYn">
								<option value="N">N</option>
								<option value="Y">Y</option>
						</select>
						</td>
						<th><label for="labelForId" class="siteAddForm-name">케이싱구경(m)</label></th>
						<td><input name="csiDia" type="text"
							class="siteAddForm-input csiDia" id="csiDia" value="${list.csiDia}"></td>
					</tr>
						<tr>
						<th><label for="labelForId" class="siteAddForm-name">
							비고</label></th>
						<td colspan="4"><input name="doc" type="text"
							class="siteAddForm-input doc" id="doc" value="${list.doc}"></td>
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
				<button type="button" class="btn-xl bd-blue bg-blue white" id="siteUpdateData"
					>수정하기</button>
				<!-- 						<button type="button" class="btn-xl bd-blue bg-blue white" onclick="siteUpdate();">수정하기</button> -->
				<button type="button" class="btn-xl bd-blue bg-white blue pop-close" id=siteUpdateCancel>취소</button>
			</div>
		<!-- </form> -->
	</div>
</sec:authorize>
</html>