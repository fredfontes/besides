<html>

<head>
<title>&#139 &#139 BeSides Web Design &#155 &#155</title>
<style>
    #screen {text-align: center; position: relative; border: 1pt gray solid; width: 100%; cursor: crosshair; padding: 0pt; margin: 0pt; font-family: arial; background: black}
    #paddle {position: absolute; background: navy; font-size: 0pt}
    #board DIV{position: absolute; border: 1px black solid; font-size: 0pt}
    #ball {position: absolute; font-size: 0pt; background: white; width: 5; height: 5}
    DIV.floor0 {background: #000011}
    DIV.floor1, DIV.floor5 {background: #000033}
    DIV.floor2, DIV.floor6 {background: #000055}
    DIV.floor3, DIV.floor7 {background: #000077}
    DIV.floor4, DIV.floor8 {background: #000099}
  </style>
<script LANGUAGE="Javascript">
     var MS=navigator.appVersion.indexOf("MSIE");
     window.isIE4 =(MS>0) && ((parseInt(navigator.appVersion.substring(MS+5,MS+6)) >= 4) && (navigator.appVersion.indexOf("MSIE"))>0);
     var curShow = null
     var curItem = null

     if (!window.isIE4)
        window.location.href = "#";

    </script>
<script LANGUAGE="JavaScript" FOR="jumpbar"
EVENT="onscriptletevent(name, eventData)">
<!--
switch (name) {
         case "onnavigate":
           window.location.href = eventData
           break; 
         case "oncnavigate":
           eval(eventData)
           break;
       }

function MM_displayStatusMsg(msgStr) { //v1.0
  status=msgStr;
  document.MM_returnValue = true;
}
//-->
</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#000000"
background=""  text="#FFFFFF" link="#000080" vlink="#666666" alink="#ffcc00" leftmargin="3" topmargin="3" bgproperties="fixed" onLoad="ballInfo.game=true;return document.MM_returnValue" bg>
<p><script>

    function getOffset(e) {
      var s = e.srcElement
      var t = e.offsetX
      while ((s!=null) && (s.id!="screen")) {
        t+= s.offsetLeft
        s = s.offsetParent
      }
      return t
    }

    function doMouseMove() {
      var newLeft = getOffset(window.event)
      if (newLeft+boardInfo.paddleWidth>boardInfo.totalWidth)
        newLeft=boardInfo.totalWidth+8 - boardInfo.paddleWidth
      document.all.paddle.style.pixelLeft = newLeft
    }
  </script>
</p>
<center><div style=" align=" center"><div id="screen">

<p><script>

    var boardInfo = new Object()
    boardInfo.blocks = 10
    boardInfo.floors = 5
    boardInfo.parts = boardInfo.blocks * boardInfo.floors
    boardInfo.width  = 40
    boardInfo.height = 16
    boardInfo.ceiling = 30
    boardInfo.area = 160
    boardInfo.totalWidth = boardInfo.width*boardInfo.blocks - 8
    boardInfo.paddleHeight = Math.round(boardInfo.height/2)
    boardInfo.totalHeight = (boardInfo.height * boardInfo.floors) + boardInfo.ceiling + boardInfo.area - (boardInfo.paddleHeight*2.5)
    boardInfo.paddleWidth = 50
    boardInfo.paddleJump = 2
    var ballInfo = new Object()
    ballInfo.score = 0
    ballInfo.count = 0
    ballInfo.balls = 3
    ballInfo.game = false
    ballInfo.left = 0
    ballInfo.top = (boardInfo.height*boardInfo.floors) + 5 + boardInfo.ceiling    
    ballInfo.dx = 5
    ballInfo.dy = 5
    ballInfo.timing = 50

    var str = "<DIV ID=board>"
    for (var h = 0; h < boardInfo.floors; h++) 
      for (var w =0; w < boardInfo.blocks; w++)
        str+="<DIV CLASS=\"floor"+h+"\" STYLE=\"top:" + (boardInfo.ceiling + (h*boardInfo.height)) + "; left:" + (boardInfo.width * w) + "; width: " +(boardInfo.width) + "; height: " + (boardInfo.height) + "\"></DIV>\n"
    str+="</DIV>"
    document.all.screen.style.pixelWidth = (boardInfo.width*boardInfo.blocks) + 2
    document.all.screen.style.pixelHeight = (boardInfo.height * boardInfo.floors) + boardInfo.ceiling + boardInfo.area 
    var paddle = "<DIV ID=paddle STYLE=\"top: " + (document.all.screen.style.pixelHeight - (boardInfo.paddleHeight *2.5)) + "; width: " + boardInfo.paddleWidth + "; height: " + boardInfo.paddleHeight + ";Left: 10\"></DIV>"
    var ball = "<DIV ID=ball STYLE=\"top: " + (5+boardInfo.ceiling + (boardInfo.floors*boardInfo.height)) + "; left: 0\"></DIV>"
    document.write(str + paddle + ball)

    ballInfo.ball = document.all.ball   
    ballInfo.offsetTop = ballInfo.ball.offsetParent.offsetTop
    ballInfo.offsetLeft = ballInfo.ball.offsetParent.offsetLeft
    ballInfo.posTop = ballInfo.ball.offsetTop
    ballInfo.posLeft = ballInfo.ball.offsetLeft
    ballInfo.offsetHeight = ballInfo.ball.offsetHeight
    ballInfo.offsetWidth = ballInfo.ball.offsetWidth

    ballInfo.paddle = document.all.paddle
    ballInfo.paddleTop = ballInfo.paddle.offsetTop

    function displayBoard() {
      ballInfo.count = 0
      var ch = document.all.board.children
      var cnt = ch.length
      for (var i = 0; i < cnt; i++) {
        if (boardInfo.floors<9)
          ch[i].className="floor" + (parseInt(ch[i].className.substring(5,6))+1)
        ch[i].style.display = ""
      }
      if (boardInfo.floors<9) {
        boardInfo.floors++
        for (var w =0; w < boardInfo.blocks; w++)
          document.all.board.insertAdjacentHTML("beforeEnd","<DIV CLASS=\"floor1\" STYLE=\"top:" + (boardInfo.ceiling + ((boardInfo.floors-1)*boardInfo.height)) + "; left:" + (boardInfo.width * w) + "; width: " +(boardInfo.width) + "; height: " + (boardInfo.height) + "\"></DIV>\n")
      }
      boardInfo.parts = boardInfo.blocks * boardInfo.floors
    }

    function moveBall() {
      var newLeft = ballInfo.posLeft
      var newTop = ballInfo.posTop 
      var el = null
      var testLeft = newLeft + ballInfo.offsetLeft + ballInfo.dx
      if (ballInfo.dx>0)
        testLeft+=ballInfo.offsetWidth+4
      if (newTop<boardInfo.ceiling+(boardInfo.floors*boardInfo.height)+2) {
        var testTop = newTop + ballInfo.offsetTop + ballInfo.dy 
        if (ballInfo.dy>0)
          testTop+=ballInfo.offsetHeight+4
        el = document.elementFromPoint(testLeft-document.body.scrollLeft, testTop-document.body.scrollTop)
      }
      
      if ((el!=null) && (el.style.display!="none") && (el.className.substring(0,5)=="floor")) {
        if ((newTop<el.style.pixelTop)||(newTop>(el.style.pixelTop+boardInfo.height))) 
          ballInfo.dy*=-1 
        else
          if ((newLeft<=el.style.pixelLeft)||(newLeft>=(el.style.pixelLeft+boardInfo.width)))  
            ballInfo.dx*=-1
          else
            ballInfo.dy*=-1
        el.style.display = "none"
        ballInfo.count++
        if (ballInfo.count==boardInfo.parts) 
          displayBoard()
        ballInfo.score+=boardInfo.floors-parseInt(el.className.substring(5,6))
        document.all.score.innerText = ballInfo.score
      }
      newTop+= ballInfo.dy
      newLeft+= ballInfo.dx
      if (newLeft<0) {
        newLeft = 0
        ballInfo.dx*=-1
      } 
        else
          if (newLeft>boardInfo.totalWidth) {
            newLeft = boardInfo.totalWidth
            ballInfo.dx*=-1
          }
      if (newTop<0) {
        newTop = 0
        ballInfo.timing=40
        ballInfo.dy *=-1
      }

      if (newTop<=boardInfo.totalHeight) {
        ballInfo.ball.style.pixelLeft =  newLeft
        ballInfo.ball.style.pixelTop = newTop
        ballInfo.posTop = newTop
        ballInfo.posLeft = newLeft
        ballInfo.running = setTimeout("moveBall()",ballInfo.timing)
      } else {
        if ((testLeft>=(ballInfo.paddle.offsetLeft + ballInfo.offsetLeft)) && (testLeft<=(ballInfo.paddle.offsetLeft + ballInfo.offsetLeft + ballInfo.paddle.offsetWidth)))  {
          var percent= ((ballInfo.ball.offsetLeft - ballInfo.paddle.offsetLeft)/ boardInfo.paddleWidth) *100
          var dir = (((50-percent)/100)*6)-1
          ballInfo.dy *=-1 
          
          if (ballInfo.dx<=0)
            dir=-(dir-9)
          ballInfo.dx+=Math.floor(dir)
          if (ballInfo.dx==0) ballInfo.dx=1
          if (((percent>50) && (ballInfo.dx<0)) || ((percent<50) && (ballInfo.dx>0)))
            ballInfo.dx*=-1
          ballInfo.running = setTimeout("moveBall()",ballInfo.timing)
        }
        else {
          if (newTop>=document.all.screen.offsetHeight - ballInfo.ball.offsetHeight - 1)
            if (ballInfo.game)
              if (ballInfo.balls>0) {
                ballInfo.balls--
                document.all.balls.innerText = ballInfo.balls
                ballInfo.ball.style.pixelTop = (5+boardInfo.ceiling + (boardInfo.floors*boardInfo.height)) 
                ballInfo.posTop = ballInfo.ball.style.pixelTop
                ballInfo.running = setTimeout("moveBall()",2000)
              }
              else
                alert("Fim do Jogo!")
            else {
              ballInfo.dy *=-1
              ballInfo.running = setTimeout("moveBall()",ballInfo.timing)
            }
          else {
            ballInfo.ball.style.pixelLeft =  newLeft
            ballInfo.ball.style.pixelTop = newTop
            ballInfo.posTop = newTop
            ballInfo.posLeft = newLeft
            ballInfo.running = setTimeout("moveBall()",ballInfo.timing)
          }
        }
      }
    }
      document.all.screen.onmousemove = doMouseMove
    ballInfo.running = setTimeout("moveBall()",ballInfo.timing)
  </script> <br>
<br>
</p>
</div>
<center>
    <table border="0" cellpadding="2" cellspacing="2" bgcolor="#333333" align="center">
      <tr> 
        <td bgcolor="#000000"><font   face="Arial, Verdana" size="2">Bolas restantes:</font></td>
        <td bgcolor="#000000" id="balls"><font   face="Arial, Verdana" size="2">2</font></td>
  </tr>
      <tr> 
        <td bgcolor="#000000"><font face="Arial, Verdana" size="2">Placar: </font></td>
        <td bgcolor="#000000" id="score"><font   face="Arial, Verdana" size="2">0</font></td>
  </tr>
      <tr> 
        <td bgcolor="#000000"><font   face="Arial, Verdana" size="2">Nível: </font></td>
        <td bgcolor="#000000"> 
          <input name="mode" type="radio"
    onClick="ballInfo.game=false; ballInfo.balls=3; ">
          <font  
    face="Arial, Verdana" size="2">Fácil</font></td>
  </tr>
      <tr> 
        <td bgcolor="#000000"></td>
        <td bgcolor="#000000"> 
          <input name="mode" type="radio" onClick="ballInfo.game=true" checked>
          <font size="2"
     >Médio</font></td>
  </tr>
      <tr bgcolor="#000000"> 
        <td colspan="2" align="center"> 
          <input type="Button" onClick="window.location.reload()"
    value="Recomeçar" name="Button"> </td>
  </tr>
</table>
</center>
</div>
</body>
</html>
<noframes>
<html></html>