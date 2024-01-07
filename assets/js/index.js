var idleTime = 0;
$(document).ready(function(){
  chk_roles(atob(sessionStorage.getItem(btoa("emp_id"))));
  get_userinfo(atob(sessionStorage.getItem(btoa("emp_id"))));
  chk_session();
  // Increment the idle time counter every minute.
    var idleInterval = setInterval(timerIncrement, 1800000); // 1 minute 60000 1800000

    // Zero the idle timer on mouse movement.
    $(this).mousemove(function (e) {
        idleTime = 0;
    });
    $(this).keypress(function (e) {
        idleTime = 0;
    });
    timerIncrement();

    $("#logout").on('click',function(){
        event.preventDefault();
        logout();
    });
    $("#logout2").on('click',function(){
        event.preventDefault();
        logout();
    });


});

function logout(){
  sessionStorage.clear();
  window.location.href = "home.html";
}

function timerIncrement() {
       idleTime = idleTime + 1;
       if (idleTime > 1) {
           logout();
       }
   }

function chk_session(){
  if(sessionStorage.getItem("ZW1wX2lk")){

  }else{
    window.location.href = "home.html";
  }
}

function chk_roles(emp_id){

  var messageObj;
      messageObj = {module:"chk_roles", emp_id:emp_id};

      var myJson = JSON.stringify(messageObj);

      $.post(
          "api/login.php",
          messageObj,
          function(data,status){
            var r_tele, r_ir, r_trans_rfq, r_trans_quot, r_trans_so, r_trans_po;
            var r_client, r_product, r_supplier, r_emp;
            var r_acc_vat, r_acc_nvat, r_acc_cdob, r_acc_crvat, r_acc_vouc;
              if(status == "success"){
                  $.each(data,function(){
                    r_tele = this.telemarketing;
                    r_ir = this.itinerary_report;
                    r_trans_rfq = this.trans_rfq;
                    r_trans_quot = this.trans_quotation;
                    r_trans_so = this.trans_sales_order;
                    r_trans_po = this.trans_purchase_order;
                    r_client = this.client;
                    r_product = this.product;
                    r_supplier = this.supplier;
                    r_emp = this.employee;
                    r_acc_vat = this.accounting_vat;
                    r_acc_nvat = this.accounting_nvat;
                    r_acc_cdob = this.accounting_cdob;
                    r_acc_crvat = this.accounting_crvat;
                    r_acc_vouc = this.accounting_vouc;
                  });
              }else{
                  alert("API Error");
              }
                if(r_tele == 'Y'){$("#li_tele").show();}else{$("#li_tele").hide();}
                if(r_ir == 'Y'){$("#li_ir").show();}else{$("#li_ir").hide();}
                if(r_trans_rfq == 'Y'){$("#li_trans_rfq").show();}else{$("#li_trans_rfq").hide();}
                if(r_trans_quot == 'Y'){$("#li_trans_quot").show();}else{$("#li_trans_quot").hide();}
                if(r_trans_so == 'Y'){$("#li_trans_so").show();}else{$("#li_trans_so").hide();}
                if(r_trans_po == 'Y'){$("#li_trans_po").show();}else{$("#li_trans_po").hide();}
                if(r_client == 'Y'){$("#li_client").show();}else{$("#li_client").hide();}
                if(r_product == 'Y'){$("#li_product").show();}else{$("#li_product").hide();}
                if(r_supplier == 'Y'){$("#li_supplier").show();}else{$("#li_supplier").hide();}
                if(r_emp == 'Y'){$("#li_emp").show();}else{$("#li_emp").hide();}
                if(r_acc_vat == 'Y'){$("#li_acc_cdvat").show();}else{$("#li_acc_cdvat").hide();}
                if(r_acc_nvat == 'Y'){$("#li_acc_cdnvat").show();}else{$("#li_acc_cdnvat").hide();}
                if(r_acc_cdob == 'Y'){$("#li_acc_cdob").show();}else{$("#li_acc_cdob").hide();}
                if(r_acc_crvat == 'Y'){$("#li_acc_crvat").show();}else{$("#li_acc_crvat").hide();}
                if(r_acc_vouc == 'Y'){$("#li_acc_vouc").show();}else{$("#li_acc_vouc").hide();}
          }
      );
}

function get_userinfo(emp_id){
    var messageObj;
        messageObj = {module:"get_userinfo", emp_id:emp_id};
        var myJson = JSON.stringify(messageObj);

        $.post(
            "api/login.php",
            messageObj,
            function(data,status){
                if(status == "success"){
                    $.each(data,function(){
                      $("#prev_uname").text(this.first_name+" "+this.last_name);
                      $("#prev_uname2").text(this.first_name+" "+this.last_name);
                      $("#more-details").html(this.position+' <i class="fa fa-chevron-down m-l-5"></i>');

                      if(this.img_path == null || this.img_path == ""){

                          $("#prev_pic").attr("src","assets/images/user/avatar.jpg");

                      }else{
                          
                          $("#prev_pic").attr("src",this.img_path);
                          $("#prev_pic").attr("src", this.img_path + `?v=${new Date().getTime()}`);
                      }

                    });
                }else{
                    alert("API Error");
                }
            }
        );
}
