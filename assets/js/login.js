$(document).ready(function(){

  $("#btn_login").on('click',function(){
      event.preventDefault();

      if (! $('#frm_login')[0].checkValidity()) {
        $('#frm_login')[0].reportValidity();
      }else{
        //alert(md5($("#password").val()));
        login(escapeHtml($("#u_name").val()));
        //enCrypt($("#password").val());
      }

  });

  $(document).keypress(function(e){
  if (e.which == 13){
      $("#btn_login").click();
  }
});

});

function login(u_name){
  //var u_name;
  //u_name = escapeHtml($("#u_name").val());
  var messageObj;
      messageObj = {module:"login", u_name:u_name};

      var myJson = JSON.stringify(messageObj);

      $.post(
          "api/login.php",
          messageObj,
          function(data,status){
              if(status == "success"){
                  $.each(data,function(){
                    md5(this.password);
                    if(this.user_name == $("#u_name").val() && this.password == md5($("#password").val())){
                    window.location.href = "index.html";
                    sessionStorage.setItem(btoa("emp_id"), btoa(this.emp_id));
                  }else if(this.user_name !== $("#u_name").val() || this.password !== md5($("#password").val())){
                    alert("Username / Password Incorrect!");
                  }
                  // alert(deCrypt(this.password));
                  // escapeHtml(enCrypt($("#password").val()))
              });


              }else{
                  alert("API Error");
              }
          }
      );

}
