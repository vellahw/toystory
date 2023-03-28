/**
 * 230329 한원 리팩토링
 */
var canBtn = document.getElementById("cancel");
	
canBtn.addEventListener("click", function(){
	self.location = "/admin/notice/list.toy";
});
    
var delBtn = document.getElementById("deleteButton");
	
delBtn.addEventListener("click", function(){
	var fnameList = [];

    $("input[name=item]:checked").each(function(i) {
	    fnameList.push($(this).val());
    });
        
    if(fnameList.length > 0){
    	$.ajax({
        	url : "/admin/notice/modifypro.toy",
            type : "get",
            data : {
            	chbox : fnameList
            }, //변수이름 chbox ,변수값: fnameList 
            dataType : 'json',
            success : function(result) {
            }
        });
    }
    alert('게시글이 수정되었습니다.');
});

var gfv_count = 1;

$("#addFile").on("click", function(e) { //파일 추가 버튼
e.preventDefault();
fn_addFile();
});

$("a[name='delete']").on("click", function(e) { //삭제 버튼
e.preventDefault();
fn_deleteFile($(this));
});

function fn_addFile() {
var str = "<p><input type='file' name='file_" + (gfv_count++)
        + "'><a href='#this' class='btn' name='delete'>삭제</a></p>";
$("#fileDiv").append(str);
$("a[name='delete']").on("click", function(e) { //삭제 버튼
    e.preventDefault();
    fn_deleteFile($(this));
});
}

function fn_deleteFile(obj) {
obj.parent().remove();
}
function fn_checkByte(obj) {
const maxByte = 1400; //최대 100바이트
const text_val = obj.value; //입력한 문자
const text_len = text_val.length; //입력한 문자수

let totalByte = 0;
for (let i = 0; i < text_len; i++) {
    const each_char = text_val.charAt(i);
    const uni_char = escape(each_char); //유니코드 형식으로 변환
    if (uni_char.length > 4) {
        // 한글 : 2Byte
        totalByte += 3;
    } else {
        // 영문,숫자,특수문자 : 1Byte
        totalByte += 1;
    }
}

if (totalByte > maxByte) {
    alert('최대 1400Byte까지만 입력가능합니다.');
    document.getElementById("nowByte").innerText = totalByte;
    document.getElementById("nowByte").style.color = "red";
} else {
    document.getElementById("nowByte").innerText = totalByte;
    document.getElementById("nowByte").style.color = "green";
}
}