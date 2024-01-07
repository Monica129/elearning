function getCurrDateTime(){
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth() + 1;
	var day = dt.getDate();
	var hour = dt.getHours();
	var minute = dt.getMinutes();
	var second = dt.getSeconds();

	var currDteTme = (month < 10 ? "0":"") + month + "/" + (day < 10 ? "0":"") + day + "/" + year + " " +
					(hour < 10 ? "0":"") + hour + ":" + (minute < 10 ? "0":"") + minute + ":" + (second < 10 ? "0":"") + second;
	return currDteTme;
}

function getCurrDate(){
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth() + 1;
	var day = dt.getDate();

	var currDte = (month < 10 ? "0":"") + month + "/" + (day < 10 ? "0":"") + day + "/" + year;
	return currDte;
}

function getCurrDate2(){
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth() + 1;
	var day = dt.getDate();

	var currDte = year + "-" + (month < 10 ? "0":"") + month + "-" + (day < 10 ? "0":"") + day;
	return currDte;
}

function addDaystoDate2(date, days){
	var dt = new Date(date);
	dt.setDate(dt.getDate() + days);

	var year = dt.getFullYear();
	var month = dt.getMonth() + 1;
	var day = dt.getDate();

	var newDte = year + "-" + (month < 10 ? "0":"") + month + "-" + (day < 10 ? "0":"") + day;
	return newDte;
}

function getCurrTime(){
	var dt = new Date();
	var hour = dt.getHours("hh");
	var minute = dt.getMinutes();
	var second = dt.getSeconds();

	var currDteTme = (hour < 10 ? "0":"") + hour + ":" + (minute < 10 ? "0":"") + minute + ":" + (second < 10 ? "0":"") + second;
	return currDteTme;
}

function setCookie(cName,cValue,expDay){
	var expDate = new Date();
	expDate.setTime(expDate.getTime() + (expDay*24*60*60*1000));
	var expires = "expires=" + expDate.toGMTString();
	document.cookie = cName + "=" + cValue + ";" + expires + ";path=/";
}

function getCookie(cName){
	var cookieName = cName + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var cookiePiece = decodedCookie.split(";");

	for( var i = 0; i < cookiePiece.length; i++){
		var cookieCrumbs = cookiePiece[i];
		while(cookieCrumbs.charAt(0) == " "){
			cookieCrumbs = cookieCrumbs.substring(1);
		}
		if(cookieCrumbs.indexOf(cookieName) == 0){
			return cookieCrumbs.substring(cookieName.length,cookieCrumbs.length);
		}
	}

	return "";
}

function deCrypt(rawPword){
	var i = 0,a = 0,b = 0,c = 0;
	var pWord = "",pKey = "";

	do{
		pKey = pKey + "advise ";
	}while(pKey.length < rawPword.length);

	for(i = 0; i < rawPword.length; i++){
		a = rawPword.charCodeAt(i);

		b = pKey.charCodeAt(i);
		c = (a+5500-b);
		c = c % 256;
    console.log("a-" + a + " b-" + b + " c-" + c);
		pWord = pWord + String.fromCharCode(c);
	}
	// console.log(pWord);
	return pWord;
}

function enCrypt(rawPword){
	var i = 0,a = 0,b = 0,c = 0;
	var pWord = "",pKey = "";

	do{
		pKey = pKey + "advise ";
	}while(pKey.length < rawPword.length);

	for(i = 0; i < rawPword.length; i++){
		a = rawPword.charCodeAt(i);
		b = pKey.charCodeAt(i);
		c = (a+b);
    if(c < 124){
      c = c + 132;
    }else{
      c = c - 124;
    }
    //console.log("a-" + a + " b-" + b + " c-" + c);
		pWord = pWord + String.fromCharCode(c);
	}
	 console.log(pWord);
	return pWord;
}

function miniPatHdr(){
	$("#patname").html(sessionStorage.getItem("patname"));
	$("#patroom").html(sessionStorage.getItem("patroom"));
	$("#patdiag").html(sessionStorage.getItem("patdiag"));
}

function getParams(selectId,dataName){
  return($("#" + selectId + " option:selected").data(dataName));
}

function createCsNo(callback){
    var csNo = "";
    var maxCsNo;
    var prefixLength;
    var lastCsNo;
    var newCsNo;
    var numLength;

    var dt = new Date();
    var year = dt.getFullYear().toString().substr(2);
    var prefix = year + sessionStorage.getItem("csprefix");

    maxCsNo = "";

    var messageObj;
    messageObj = {
        csprefix:prefix
    };

    var myJson = JSON.stringify(messageObj);

    $.ajax({
        method: "POST",
        url: "http://190.190.5.56/api/webhomis/docord/retallmaxcs.php",
        data: messageObj,
        success: function(data){
            $.each(data,function(){
                maxCsNo = this.pcchrgcod;
                prefixLength = prefix.length;
                if(maxCsNo == "" || maxCsNo == null){
                    csNo = prefix + "0000000001".substr(prefixLength);

                    return callback(null, csNo);
                }else{
                    lastCsNo = parseInt(maxCsNo.substr(prefixLength));
                    newCsNo = lastCsNo + 1;
                    numLength = newCsNo.toString().length;
                    csNo = prefix + "0000000000".substr(prefixLength + numLength) + newCsNo.toString();

                    return callback(null, csNo);
                }
            });
        }
    });
}

function getAccessLevel(jsonData,funcCode){
	var rtnValue = "N";

	$.each(jsonData,function(){
		if(this.funccode == funcCode){
			rtnValue = "accadd:" + this.accadd + ",accedit:" + this.accedit + ",accdel:" + this.accdel + ",accview:" + this.accview + ",accprint:" + this.accprint + "";
		}
	});

	return rtnValue;
}

function getAgeDtl(dateString){
	var now = new Date();
	var today = new Date(now.getYear(),now.getMonth(),now.getDate());

	var yearNow = now.getYear();
	var monthNow = now.getMonth();
	var dateNow = now.getDate();

	var dob = new Date(dateString.substring(6,10),
	          dateString.substring(3,5)-1,
	          dateString.substring(0,2));

	var yearDob = dob.getYear();
	var monthDob = dob.getMonth();
	var dateDob = dob.getDate();

	yearAge = yearNow - yearDob;

	if (monthNow >= monthDob)
	    var monthAge = monthNow - monthDob;
	else {
	    yearAge--;
	    var monthAge = 12 + monthNow -monthDob;
	}

	if (dateNow >= dateDob)
	    var dateAge = dateNow - dateDob;
	else {
	    monthAge--;
	    var dateAge = 31 + dateNow - dateDob;

	    if (monthAge < 0) {
	        monthAge = 11;
	        yearAge--;
	    }
	}

	if(yearAge.toString().length == 1){yearAge = "0" + yearAge;}
	if(monthAge.toString().length == 1){monthAge = "0" + monthAge;}
	if(dateAge.toString().length == 1){dateAge = "0" + dateAge;}

	return yearAge + "|" + monthAge + "|" + dateAge;
}

function generatePaymayaAuthorization(){
	var publicApi, authCode;
	publicApi = "pk-cu7n6AM3DwnwNesm3VM3bknPvC43VaTgcpTJNcf81sR:";

	authCode = "Basic " + btoa(publicApi);
	return authCode;
}

function generatePaymayaAuthorizationSecret(){
	var publicApi, authCode;
	publicApi = "sk-DjUbkeNQa4S9odrj7lP8BeMnHS4LgHod0XF1W7FCKk3:";

	authCode = "Basic " + btoa(publicApi);
	return authCode;
}

function genHperCode(callback){
	var hperCode = "";
	var minNum = "30000000", maxNum = "40000000";
	var lastHperCode;
	var newHperCode;

	lastHperCode = "";

	var messageObj;
	messageObj = {module:"genhpercode", minnum:minNum, maxnum:maxNum};

	var myJson = JSON.stringify(messageObj);

	$.ajax({
			method: "POST",
			url: "http://190.190.5.56/api/webhomis/patinfo/patinfo.php",
			data: messageObj,
			success: function(data){
					$.each(data,function(){
							lastHperCode = this.hcounter;
							newHperCode = parseInt(lastHperCode) + 1;

							return callback(null, newHperCode);
					});
			},
      error: function(jqXHR, textStatus, errorThrown){
         console.log(jqXHR.responseText);
      }
	});
}

function escapeHtml(text) {
  var map = {
    '&': '\&',
    '<': '\<',
    '>': '\>',
    '"': '\"',
    "'": "''"
  };

  return text.replace(/[&<>"']/g, function(m) { return map[m]; });
}

function validateEmail(email) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return emailReg.test( email );
}

function load_jquery3(){
  $.ajax({
    type: "GET",
    url: "assets/js/jquery-3.1.1.js",
    dataType: "script",
    async: false
  })
}

function load_js(){
	$.ajax({
		type: "GET",
		url: "assets/js/plugins/bootstrap.min.js",
		dataType: "script",
		async: false
	})

	$.ajax({
		type: "GET",
		url: "assets/js/pcoded.min.js",
		dataType: "script",
		async: false
	})
}
function make_date(dateval){
	var new_date;
	var trandate = new Date(dateval);
  var tranday = trandate.getDate();
  if (tranday <10){
    tranday = "0"+tranday;
  }
  var tranmonth = trandate.getMonth() + 1;
  if (tranmonth <10){
    tranmonth = "0"+tranmonth;
  }
  var tranyear = trandate.getFullYear();
  var tranhour = trandate.getHours();
  if (tranhour <10){
    tranhour = "0"+tranhour;
  }
  var tranmin = trandate.getMinutes();
  if (tranmin <10){
    tranmin = "0"+tranmin;
  }

  var fulldate = tranmonth +"/"+tranday +"/"+tranyear+" "+tranhour+":"+tranmin;

  if (Date.parse(fulldate)) {

   new_date = "'"+fulldate+"'";
   } else {
    new_date = "NULL";
  }

	return new_date;
}

function make_date2(dateval){
	var new_date;
	var trandate = new Date(dateval);
  var tranday = trandate.getDate();
  if (tranday <10){
    tranday = "0"+tranday;
  }
  var tranmonth = trandate.getMonth() + 1;
  if (tranmonth <10){
    tranmonth = "0"+tranmonth;
  }
  var tranyear = trandate.getFullYear();


  var fulldate = tranmonth +"/"+tranday +"/"+tranyear;

  if (Date.parse(fulldate)) {

   new_date = "'"+fulldate+"'";
   } else {
    new_date = "NULL";
  }

	return new_date;
}

function disp_datetime(date_val){
		var date = new Date(date_val);
		var day = date.getDate();
		if (day <10){
		  day = "0"+day;
		}
		var month = date.getMonth() + 1;
		if (month <10){
		  month = "0"+month;
		}
		var hour = date.getHours();
		if (hour<10){
		  hour = "0"+hour;
		}
		var min = date.getMinutes();
		if (min <10){
		  min = "0"+min;
		}
		var year = date.getFullYear();
		var fulldate = year+"-"+month+"-"+day+"T"+hour+":"+min;

		return fulldate;
}

function disp_date(date_val){
		var date = new Date(date_val);
		var day = date.getDate();
		if (day <10){
		  day = "0"+day;
		}
		var month = date.getMonth() + 1;
		if (month <10){
		  month = "0"+month;
		}
		var hour = date.getHours();
		if (hour<10){
		  hour = "0"+hour;
		}
		var min = date.getMinutes();
		if (min <10){
		  min = "0"+min;
		}
		var year = date.getFullYear();
		var fulldate = year+"-"+month+"-"+day;

		return fulldate;
}
