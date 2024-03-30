<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- 	<head> -->
<!-- 		<meta charset="UTF-8"> -->
<!-- 		<title>First AJAX</title> -->
<!-- 		<script src="js/jquery-3.7.1.js" type="text/javascript"></script> -->
<!-- 		<style> -->
<!--  			th {background-color:#9199BE}  -->
<!--  			.fileInfo td {text-align:center}  -->
<!--  			.fileInfo {height:42px;}  -->
<!-- 		</style> -->
<!-- 	</head> -->
<!-- 	<body> -->
<!-- 		<div align="center"><br> -->
<!-- 			<span id="counts"></span>		 -->
<!-- 		</div> -->
<!-- 		<div align="center"><br> -->
<!-- 			<table id="subFiles"></table>		 -->
<!-- 		</div> -->
		
<!-- 		<script> -->
<!--  			setTimeout(wWDLsubFiles,10); -->
<!--  			function wWDLsubFiles(){ -->
<!--  				$.ajax({ -->
<!--  					cache:false, -->
<!--  					type:"POST", -->
<!--  					contentType:"application/json; charset=utf-8", -->
<!--  					dataType:"json", -->
<!--  					url:"ajax_subFiles.jsp", -->
<!--  					async:true, -->
<!--  					error:function(request){ -->
<!--  						alert("傳送請求失敗!"); -->
<!--  					}, -->
<!--  					success:function(data){ -->
<!--  						console.log(data); -->
<!--  						var count="<span style='color:#DD00DD; font-weight:900;'> 【file Counts】:" + data.length + "<span>"; -->
<!--  						var str="<table width='470px'>"+ -->
<!--  							"<tr>"+ -->
<!--  								"<th width='30px'>No.</th>"+ -->
<!--  								"<th width='180px'>filename</th>"+ -->
<!--  								"<th width='180px'>createTime</th>"+ -->
<!--  								"<th width='180px'>lastModifiedTime</th>"+ -->
<!--  							"</tr>"; -->
<!--  						for(var i=0;i<data.length;i++){ -->
<!--  							console.log("filename: "+data[i].filename); -->
<!--  							str+="<tr class='fileInfo'>"+ --!>
<!--  								" <td> <span class='block' style='font-weight:900'; id='spanl'>" +data[i].id+ "</span> </td>"+ -->
<!--  								" <td> <span class='block' style='font-weight:900'; id='spanl'>" +data[i].filename+ "</span> </td>"+ -->
<!--  								" <td> <span class='block' style='font-weight:900'; id='spanl'>" +data[i].createTime+ "</span> </td>"+ -->
<!--  								" <td> <span class='block' style='font-weight:900'; id='spanl'>" +data[i].lastModifiedTime+ "</span> </td>"+ -->
<!--  								" </tr>"; -->
<!--  						} -->
<!--  						str += "</table>"; -->
<!--  						$("#counts").html(count); -->
<!--  						$("#subFiles").html(str); -->
<!--  					} -->
<!--  				}); -->
<!--  			} -->
<!--  			setInterval(wWDLsubFiles,3000); -->
<!-- 		</script> -->
		
<!-- 	</body> -->
<!-- </html> -->



<!DOCTYPE html>
<html>
    <head>
        <meta charset="BIG5">
        <title>First AJAX</title>
        <script src="js/jquery-3.7.1.js" type="text/javascript"> </script>
        <style>
            th {background-color: #9199BE}
            .fileInfo td {text-align: center;}
            .fileInfo {height:42px;}
        </style>
    </head>
    <body>
        <div align="center" ><br>
            <span id="counts"></span>
        </div>
        <div align="center" ><br>
            <table id="subFiles" > </table>
        </div>

        <script>
            setTimeout(wWDLsubFiles,10); //只有呼叫一次,千分之一秒(0.01秒)
            function wWDLsubFiles(){ //指定 <- 這個方ㄒㄩㄢˇ
                $.ajax({
                    cache: false,
                    type: "POST",
                    contenType: "application/json: charset=utf-8",
                    dataType: "json", // 預期從伺服器回傳的資料型別
                    url:"ajax_subFiles.jsp",
                    async: true, //不一定是true,要有經驗判斷業務邏輯有無需....
                    error: function(request){
                        alert("傳送請求失敗！"); //alert在網頁會很死,用 Modal會比較有美感
                    },
                    success: function(data) {

                        console.log(data);
                        var count = "<span style='color:#DD00DD; font-weight:900;'> 【File Counts】:" + data.length + "</span>";
                        var str = "<table width='470px'>" +
                                        "<tr>" +
                                             "<th width='30px'>No.</th>" +
                                             "<th width='180px'>filename</th>" +
                                             "<th width='180px'>createTime</th>" +
                                             "<th width='180px'>lastModifiedTime</th>" +
                                        "</tr>";
                        for(var i=0; i<data.length; i++){

                            console.log("filename: " + data[i].filename);
                            str += "<tr class='fileInfo'>" +
                                   "  <td> <span style='font-weight:900; id='span1'>" + data[i].id + "</span> </td>" +
                                   "  <td> <span style='font-weight:900; id='span1'>" + data[i].filename + "</span> </td>" +
                                   "  <td> <span style='font-weight:900; id='span1'>" + data[i].createTime + "</span> </td>" +
                                   "  <td> <span style='font-weight:900; id='span1'>" + data[i].lastModifiedTime + "</span> </td>" +
                            "</tr>";
                        }
                        str += "</table>"
                        $("#counts").html(count);
                        $("#subFiles").html(str);
                    }
                });
            }
            setInterval(wWDLsubFiles, 3000);
        </script>
    </body>
</html>
