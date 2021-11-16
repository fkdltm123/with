function CheckAddProduct(){
	
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	if(!check(/^P[0-9]{4,11}$/, productId,
			"[상품 코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요"))
		return false;
	
	if(name.value.length < 4 || name.value.length > 12){
		alert("[상품명]\n최소 4자에서 최대 12자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요");
		unitPrie.select();
		unitPrice.focus();
		return false;
	}
	
	if(unitPrice.value < 0){
		alert("[가격]\n음수는 입력할 수 없습니다");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if(!check(/^\d+(?:[.]?[\d]?]\d])?$/, unitPrice,
					"[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return  false;
	
	if(isNaN(unitsInStock.value)){
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	function check(regExp, e, msg){
		
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newProduct.submit();
}

function CheckPassword(){
	
	var pw = document.getElementById("m_pw");
	var pwck = document.getElementById("m_pwck");
	
	if(pw.value.length < 4 || pw.value.length > 12){
		alert("[비밀번호]\n최소 4자에서 최대 12자까지 입력하세요");
		pw.select();
		pw.focus();
		return false;
	}
	
	if(pw.value != pwck.value){
		alert("비밀번호가 다릅니다. 다시 확인해주세요.");
		pw.select();
		pw.focus();
		return false;
	}
	
	document.newMember.submit();
}

function UpdateCheckPassword(){
	
	var pw = document.getElementById("m_pw");
	var pwck = document.getElementById("m_pwck");
	var pwC = document.getElementById("m_pwC");
	var pwCck = document.getElementById("m_pwCck");
	
	if(pwC.value != null && pwCck.value != null){
		if(pwC.value != pwCck.value){
			alert("현재 비밀번호가 다릅니다. 다시 확인해주세요.");
			pwC.select();
			pwC.focus();
			return false;
		}
	}
	if(pw.value.length < 4 || pw.value.length > 12){
		alert("[비밀번호]\n최소 4자에서 최대 12자까지 입력하세요");
		pw.select();
		pw.focus();
		return false;
	}
	
	if(pw.value != pwck.value){
		alert("비밀번호가 다릅니다. 다시 확인해주세요.");
		pw.select();
		pw.focus();
		return false;
	}
	
	document.updateMember.submit();
}
