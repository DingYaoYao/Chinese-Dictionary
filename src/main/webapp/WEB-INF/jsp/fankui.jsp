<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>阳</title>
    <!-- CSS goes in the document HEAD or added to your external stylesheet -->

    <link href="${ctx}/static/css/sb-admin-2.min.css" rel="stylesheet">
    <script type="text/javascript"
            src='${ctx}/static/js/jquery-3.1.1.min.js'></script>

    <script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <script type="text/javascript">
        console.log(returnCitySN["cip"]+','+returnCitySN["cname"])
        var IPname=returnCitySN["cip"]+','+returnCitySN["cname"];
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#submittowo').click(function () {
                var text = $("#text").val();
                if (text.length == 0) {
                   alert("请认真填写昵称");
                    return;
                }
                var name = $("#name").val();
                if (name.length == 0) {
                    alert("请认真填写建议");
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: "${ctx}/v1/fankui",
                    data: {text: name, name: text,ip: IPname},
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    async: false,
                    success:function(data){
                        if(data==1) {
                            alert("感谢您的反馈");
                        }else     if(data==2){
                            alert("感谢您的反馈 该词已被记录");
                        }else{
                            alert("反馈失败请重试");
                        }
                    },
                    error:function(data){
                        alert("建议失败请重试");
                    }
                });

            });
        })
    </script>

</head>

<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">新词提交 将会直接录入词库中（请谨慎填写）</h1>
                                </div>
                                <div class="user" action="">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="text" name="text" placeholder="请输入你的昵称">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="请输入你的建议或新词">
                                    </div>
                                    <div class="form-group">
                                    </div>
                                    <font color="red"></font>
                                    <button class="btn btn-primary btn-user btn-block" id="submittowo" >重生</button>
                                    <hr>
                                </div>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="${ctx}/index">回到阴</a>    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body></html>