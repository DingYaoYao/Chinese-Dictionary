<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>阴</title>
    <script >
        onload = function() {
            var click_cnt = 0;
            var $html = document.getElementsByTagName("html")[0];
            var $body = document.getElementsByTagName("body")[0];
            $html.onclick = function(e) {
                var $elem = document.createElement("b");
                $elem.style.color = "#E94F06";
                $elem.style.zIndex = 9999;
                $elem.style.position = "absolute";
                $elem.style.select = "none";
                var x = e.pageX;
                var y = e.pageY;
                $elem.style.left = (x - 10) + "px";
                $elem.style.top = (y - 20) + "px";
                clearInterval(anim);
                switch (++click_cnt) {
                    case 10:
                        $elem.innerText = "OωO";
                        break;
                    case 20:
                        $elem.innerText = "(๑•́ ∀ •̀๑)";
                        break;
                    case 30:
                        $elem.innerText = "(๑•́ ₃ •̀๑)";
                        break;
                    default:
                        $elem.innerText = "⭐🌙🌙⭐";
                        break;
                }
                $elem.style.fontSize = Math.random() * 10 + 8 + "px";
                var increase = 0;
                var anim;
                setTimeout(function() {
                    anim = setInterval(function() {
                        if (++increase == 150) {
                            clearInterval(anim);
                            $body.removeChild($elem);
                        }
                        $elem.style.top = y - 20 - increase + "px";
                        $elem.style.opacity = (150 - increase) / 120;
                    }, 8);
                }, 70);
                $body.appendChild($elem);
            };
        };
    </script>
    <script type="text/javascript"
            src='${ctx}/static/js/jquery-3.1.1.min.js'></script>

    <script type="text/javascript">
        var IPname;
        $.get('https://qifu-api.baidubce.com/ip/local/geo/v1/district', function (data) {
            IPname= JSON.stringify(data)
        });
    </script>
    <style type="text/css">
        table.gridtable {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
        }
        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #dedede;
        }
        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }
        canvas{cursor:crosshair;display:block;left:0;position:absolute;top:480;z-index:20}
    </style>
    <link href="${ctx}/static/css/sb-admin-2.min.css" rel="stylesheet">

    <script type="text/javascript">
        $(document).ready(function () {
            var html='';

            html+='<tr><td> </td>';
            html+='<td> 当前可以使用四种匹配方式 </td>';
            html+='<td> </td>';
            html+='<td> </td></tr>';
            html+='<tr><td> </td>';
            html+='<td> 第一框输入可能知道的某几个字  </td>';
            html+='<td> </td>';
            html+='<td> </td></tr>';
            html+='<tr><td> </td>';
            html+='<td> 第二框输入您可能知道的字数  默认为0 则匹配全部  </td>';
            html+='<td> </td>';
            html+='<td> </td></tr>';
            html+='<tr><td> </td>';
            html+='<td> 第三框输入您可能知道的谐音首拼 如《拔腿毛》BTM任意一拼</td>';
            html+='<td> </td>';
            html+='<td> </td></tr>';
            html+='<tr><td> </td>';
            html+='<td> 第四框输入您可能知道的某种拆字描述 不知道就不必输入 例：《十八厘米》→木《很多水》→水  </td>';
            html+='<td> </td>';
            html+='<td> </td></tr>';
            html+='<tr><td> </td>';
            html+='<td> 以下为常用拆字示范（如果描述中出几点水 直接输入水即可）  </td>';
            html+='<td> </td>';
            html+='<td> </td></tr>';
            html+='<tr><td> 呆</td>';
            html+='<td> 口木>丨乛一>十人></td>';
            html+='<td> </td>';
            html+='<td> </td></tr>';
            html+='<tr><td> 沐浴露</td>';
            html+='<td> 水木>乛亅丶乀>十人>水谷>乛亅丶乀>八人口>雨路>一冂丨丶丶丶丶>足各></td>';
            html+='<td> </td>';
            html+='<td> </td></tr>';
            html+='<tr><td> 花果茶</td>';
            html+='<td>草化>草早>人匕>日木>口一>十人>草人一小>草早>丿乀>八亅></td>';
            html+='<td> </td>';
            html+='<td> </td></tr>';
            html+='<tr><td> 雪梨</td>';
            html+='<td> 雨彐>一冂丨丶丶丶丶>利木>禾刀>十人></td>';
            html+='<td> </td>';
            html+='<td> </td></tr>';
            html+='<tr><td> 雷峰塔</td>';
            html+='<td> 雨田>一冂丨丶丶丶丶>囗十>山夆>凵丨>夂丰>土荅>十一>草合></td>';
            html+='<td> </td>';
            html+='<td> </td></tr>';

            $("#contentchiku").html(html);


            //烟花start
            var Fireworks = function(){
                var self = this;
                var rand = function(rMi, rMa){return ~~((Math.random()*(rMa-rMi+1))+rMi);}
                var hitTest = function(x1, y1, w1, h1, x2, y2, w2, h2){return !(x1 + w1 < x2 || x2 + w2 < x1 || y1 + h1 < y2 || y2 + h2 < y1);};
                window.requestAnimFrame=function(){return window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||function(a){window.setTimeout(a,1E3/60)}}();

                self.init = function(){
                    self.canvas = document.createElement('canvas');
                    self.canvas.width = self.cw = $(window).innerWidth();
                    self.canvas.height = self.ch = $(window).innerHeight();
                    self.particles = [];
                    self.partCount = 150;
                    self.fireworks = [];
                    self.mx = self.cw/2;
                    self.my = self.ch/2;
                    self.currentHue = 30;
                    self.partSpeed = 5;
                    self.partSpeedVariance = 10;
                    self.partWind = 50;
                    self.partFriction = 5;
                    self.partGravity = 1;
                    self.hueMin = 0;
                    self.hueMax = 360;
                    self.fworkSpeed = 4;
                    self.fworkAccel = 10;
                    self.hueVariance = 30;
                    self.flickerDensity = 25;
                    self.showShockwave = true;
                    self.showTarget = false;
                    self.clearAlpha = 25;

                    $(document.body).append(self.canvas);
                    self.ctx = self.canvas.getContext('2d');
                    self.ctx.lineCap = 'round';
                    self.ctx.lineJoin = 'round';
                    self.lineWidth = 1;
                    self.bindEvents();
                    self.canvasLoop();

                    self.canvas.onselectstart = function() {
                        return false;
                    };
                };

                self.createParticles = function(x,y, hue){
                    var countdown = self.partCount;
                    while(countdown--){
                        var newParticle = {
                            x: x,
                            y: y,
                            coordLast: [
                                {x: x, y: y},
                                {x: x, y: y},
                                {x: x, y: y}
                            ],
                            angle: rand(0, 360),
                            speed: rand(((self.partSpeed - self.partSpeedVariance) <= 0) ? 1 : self.partSpeed - self.partSpeedVariance, (self.partSpeed + self.partSpeedVariance)),
                            friction: 1 - self.partFriction/100,
                            gravity: self.partGravity/2,
                            hue: rand(hue-self.hueVariance, hue+self.hueVariance),
                            brightness: rand(50, 80),
                            alpha: rand(40,100)/100,
                            decay: rand(10, 50)/1000,
                            wind: (rand(0, self.partWind) - (self.partWind/2))/25,
                            lineWidth: self.lineWidth
                        };
                        self.particles.push(newParticle);
                    }
                };


                self.updateParticles = function(){
                    var i = self.particles.length;
                    while(i--){
                        var p = self.particles[i];
                        var radians = p.angle * Math.PI / 180;
                        var vx = Math.cos(radians) * p.speed;
                        var vy = Math.sin(radians) * p.speed;
                        p.speed *= p.friction;

                        p.coordLast[2].x = p.coordLast[1].x;
                        p.coordLast[2].y = p.coordLast[1].y;
                        p.coordLast[1].x = p.coordLast[0].x;
                        p.coordLast[1].y = p.coordLast[0].y;
                        p.coordLast[0].x = p.x;
                        p.coordLast[0].y = p.y;

                        p.x += vx;
                        p.y += vy;
                        p.y += p.gravity;

                        p.angle += p.wind;
                        p.alpha -= p.decay;

                        if(!hitTest(0,0,self.cw,self.ch,p.x-p.radius, p.y-p.radius, p.radius*2, p.radius*2) || p.alpha < .05){
                            self.particles.splice(i, 1);
                        }
                    };
                };

                self.drawParticles = function(){
                    var i = self.particles.length;
                    while(i--){
                        var p = self.particles[i];

                        var coordRand = (rand(1,3)-1);
                        self.ctx.beginPath();
                        self.ctx.moveTo(Math.round(p.coordLast[coordRand].x), Math.round(p.coordLast[coordRand].y));
                        self.ctx.lineTo(Math.round(p.x), Math.round(p.y));
                        self.ctx.closePath();
                        self.ctx.strokeStyle = 'hsla('+p.hue+', 100%, '+p.brightness+'%, '+p.alpha+')';
                        self.ctx.stroke();

                        if(self.flickerDensity > 0){
                            var inverseDensity = 50 - self.flickerDensity;
                            if(rand(0, inverseDensity) === inverseDensity){
                                self.ctx.beginPath();
                                self.ctx.arc(Math.round(p.x), Math.round(p.y), rand(p.lineWidth,p.lineWidth+3)/2, 0, Math.PI*2, false)
                                self.ctx.closePath();
                                var randAlpha = rand(50,100)/100;
                                self.ctx.fillStyle = 'hsla('+p.hue+', 100%, '+p.brightness+'%, '+randAlpha+')';
                                self.ctx.fill();
                            }
                        }
                    };
                };


                self.createFireworks = function(startX, startY, targetX, targetY){
                    var newFirework = {
                        x: startX,
                        y: startY,
                        startX: startX,
                        startY: startY,
                        hitX: false,
                        hitY: false,
                        coordLast: [
                            {x: startX, y: startY},
                            {x: startX, y: startY},
                            {x: startX, y: startY}
                        ],
                        targetX: targetX,
                        targetY: targetY,
                        speed: self.fworkSpeed,
                        angle: Math.atan2(targetY - startY, targetX - startX),
                        shockwaveAngle: Math.atan2(targetY - startY, targetX - startX)+(90*(Math.PI/180)),
                        acceleration: self.fworkAccel/100,
                        hue: self.currentHue,
                        brightness: rand(50, 80),
                        alpha: rand(50,100)/100,
                        lineWidth: self.lineWidth
                    };
                    self.fireworks.push(newFirework);

                };


                self.updateFireworks = function(){
                    var i = self.fireworks.length;

                    while(i--){
                        var f = self.fireworks[i];
                        self.ctx.lineWidth = f.lineWidth;

                        vx = Math.cos(f.angle) * f.speed,
                            vy = Math.sin(f.angle) * f.speed;
                        f.speed *= 1 + f.acceleration;
                        f.coordLast[2].x = f.coordLast[1].x;
                        f.coordLast[2].y = f.coordLast[1].y;
                        f.coordLast[1].x = f.coordLast[0].x;
                        f.coordLast[1].y = f.coordLast[0].y;
                        f.coordLast[0].x = f.x;
                        f.coordLast[0].y = f.y;

                        if(f.startX >= f.targetX){
                            if(f.x + vx <= f.targetX){
                                f.x = f.targetX;
                                f.hitX = true;
                            } else {
                                f.x += vx;
                            }
                        } else {
                            if(f.x + vx >= f.targetX){
                                f.x = f.targetX;
                                f.hitX = true;
                            } else {
                                f.x += vx;
                            }
                        }

                        if(f.startY >= f.targetY){
                            if(f.y + vy <= f.targetY){
                                f.y = f.targetY;
                                f.hitY = true;
                            } else {
                                f.y += vy;
                            }
                        } else {
                            if(f.y + vy >= f.targetY){
                                f.y = f.targetY;
                                f.hitY = true;
                            } else {
                                f.y += vy;
                            }
                        }

                        if(f.hitX && f.hitY){
                            self.createParticles(f.targetX, f.targetY, f.hue);
                            self.fireworks.splice(i, 1);

                        }
                    };
                };

                self.drawFireworks = function(){
                    var i = self.fireworks.length;
                    self.ctx.globalCompositeOperation = 'lighter';
                    while(i--){
                        var f = self.fireworks[i];
                        self.ctx.lineWidth = f.lineWidth;

                        var coordRand = (rand(1,3)-1);
                        self.ctx.beginPath();
                        self.ctx.moveTo(Math.round(f.coordLast[coordRand].x), Math.round(f.coordLast[coordRand].y));
                        self.ctx.lineTo(Math.round(f.x), Math.round(f.y));
                        self.ctx.closePath();
                        self.ctx.strokeStyle = 'hsla('+f.hue+', 100%, '+f.brightness+'%, '+f.alpha+')';
                        self.ctx.stroke();

                        if(self.showTarget){
                            self.ctx.save();
                            self.ctx.beginPath();
                            self.ctx.arc(Math.round(f.targetX), Math.round(f.targetY), rand(1,8), 0, Math.PI*2, false)
                            self.ctx.closePath();
                            self.ctx.lineWidth = 1;
                            self.ctx.stroke();
                            self.ctx.restore();
                        }

                        if(self.showShockwave){
                            self.ctx.save();
                            self.ctx.translate(Math.round(f.x), Math.round(f.y));
                            self.ctx.rotate(f.shockwaveAngle);
                            self.ctx.beginPath();
                            self.ctx.arc(0, 0, 1*(f.speed/5), 0, Math.PI, true);
                            self.ctx.strokeStyle = 'hsla('+f.hue+', 100%, '+f.brightness+'%, '+rand(25, 60)/100+')';
                            self.ctx.lineWidth = f.lineWidth;
                            self.ctx.stroke();
                            self.ctx.restore();
                        }
                    };
                };

                self.bindEvents = function(){
                    $(window).on('resize', function(){
                        clearTimeout(self.timeout);
                        self.timeout = setTimeout(function() {
                            self.canvas.width = self.cw = $(window).innerWidth();
                            self.canvas.height = self.ch = $(window).innerHeight();
                            self.ctx.lineCap = 'round';
                            self.ctx.lineJoin = 'round';
                        }, 100);
                    });

                    $(self.canvas).on('mousedown', function(e){
                        self.mx = e.pageX - self.canvas.offsetLeft;
                        self.my = e.pageY - self.canvas.offsetTop;
                        self.currentHue = rand(self.hueMin, self.hueMax);
                        self.createFireworks(self.cw/2, self.ch, self.mx, self.my);

                        $(self.canvas).on('mousemove.fireworks', function(e){
                            self.mx = e.pageX - self.canvas.offsetLeft;
                            self.my = e.pageY - self.canvas.offsetTop;
                            self.currentHue = rand(self.hueMin, self.hueMax);
                            self.createFireworks(self.cw/2, self.ch, self.mx, self.my);
                        });
                    });

                    $(self.canvas).on('mouseup', function(e){
                        $(self.canvas).off('mousemove.fireworks');
                    });

                }

                self.clear = function(){
                    self.particles = [];
                    self.fireworks = [];
                    self.ctx.clearRect(0, 0, self.cw, self.ch);
                };


                self.canvasLoop = function(){
                    requestAnimFrame(self.canvasLoop, self.canvas);
                    self.ctx.globalCompositeOperation = 'destination-out';
                    self.ctx.fillStyle = 'rgba(0,0,0,'+self.clearAlpha/100+')';
                    self.ctx.fillRect(0,0,self.cw,self.ch);
                    self.updateFireworks();
                    self.updateParticles();
                    self.drawFireworks();
                    self.drawParticles();

                };

                self.init();

            }
            var fworks = new Fireworks();
            //end









            $('#submittowo').click(function () {
                var text = $("#text").val();
                var len = $("#len").val();
                if(len==''){
                    len=0;
                }
                var pinyin = $("#pinyin").val();
                var cai = $("#cai").val();
                $.ajax({
                    type: "POST",
                    url: "${ctx}/v1/query",
                    data: {text: text, len: len,pinyin:pinyin,cai:cai},
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    async: false,
                    success:function(data){
                      //  alert("已出结果");
                        var html='';
                        $("#contentchiku").html(html);
                        $.each(data,function (index,book) {
                            html+='<tr><td>'+book.id+'</td>';
                            html+='<td>'+book.text+'</td>';
                            html+='<td>'+book.len+'</td>';
                            html+='<td>'+book.pinyin+'</td>';
                            html+='<td>'+book.caizi+'</td></tr>';
                        })
                        $("#contentchiku").html(html);
                    },
                    error:function(data){
                        alert("失败请重试");
                    }
                });

                var chatext='text='+text+' len='+len+' pinyin='+pinyin+' cai='+cai;
                $.ajax({
                    type: "POST",
                    url: "${ctx}/v1/fankui",
                    data: {text: chatext, name:'查询',ip: IPname},
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    async: false,
                    success:function(data){
                    },
                    error:function(data){
                    }
                });

            });
        })
    </script>

</head>

<body class="bg-gradient-primary">

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">匹配词库</h1>
                        </div>
                        <div class="user">
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="text" name="text" onkeyup="this.value=this.value.replace(/[, ]/g,'')" placeholder="可能知道的某几个字 ">
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="len" name="len" oninput = "value=value.replace(/[^\d]/g,'')" placeholder="可能知道的字数 ">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="pinyin" name="pinyin" onkeyup="this.value=this.value.replace(/[, ]/g,'')"  placeholder="可能知道的谐音首拼">
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="cai" name="cai" onkeyup="this.value=this.value.replace(/[, ]/g,'')" placeholder="可能知道的拆字 ">
                            </div>
                            <font color="red"></font>
                            <button type="submit" class="btn btn-primary btn-user btn-block" id="submittowo" >涅槃</button>
                            <hr>
                        </div>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="${ctx}/fankui">回到阳</a>              </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="text-align: center;">
            <table border="1" style="margin: auto" class="gridtable" width='60%'>
                <tr>
                    <th>id</th>
                    <th>词</th>
                    <th>字数</th>
                    <th>拼音</th>
                    <th>拆法</th>
                </tr>
                <tbody id="contentchiku">

                </tbody>
            </table>
        </div>
    </div>
</div>
</body></html>