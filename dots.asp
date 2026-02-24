<html>

<head>
<title>&#139 &#139 BeSides Web Design &#155 &#155</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style>
#board {font-family: arial}
.dot {position: absolute; width: 5px; height: 5px; font-size: 0pt; background: #cacaca}
#line {position: absolute; font-size: 0pt; height: 5px}
.p1 {position: absolute; font-size: 0pt;background: navy}
.p2 {position: absolute; font-size: 0pt;  background: #ffcc00}
.p1B {position: absolute; font-size: 8pt; color: navy;text-align: center; font-weight: bold}
.p2B {position: absolute; font-size: 8pt; color: #ffcc00; text-align: center; font-weight: bold}
</style>
<script LANGUAGE="Javascript">
     var MS=navigator.appVersion.indexOf("MSIE");
     window.isIE4 =(MS>0) && ((parseInt(navigator.appVersion.substring(MS+5,MS+6)) >= 4) && (navigator.appVersion.indexOf("MSIE"))>0);
     var curShow = null
     var curItem = null

     if (!window.isIE4)
        window.location.href = "/home.asp";

</script>
<script LANGUAGE="JavaScript" FOR="jumpbar"
EVENT="onscriptletevent(name, eventData)">
       switch (name) {
         case "onnavigate":
           window.location.href = eventData
           break; 
         case "oncnavigate":
           eval(eventData)
           break;
       }
</script>
</head>

<body topmargin="3" leftmargin="3" bgproperties="fixed" bgcolor="#000000" text="#FFFFFF" link="#000080" vlink="#666666" alink="#ffcc00">
<center>
<table width="258" border="0" align="center">
  <!--DWLayoutTable-->
  <tr> 
    <td width="252" height="296" valign="top"><center><p class="start" ID="message">&nbsp;</p>
      <div STYLE="margin-left: 10pt; margin-top: 5pt" align="center"></div>
      <p> 
        <script
    language="JavaScript">
  var scale= 25
  var size = 5
  var totalSize = ((size+1)*scale) + 6
  var cache = new Object()
  var move=0,point=0
  var player = true

  function initCache() {
    cache.x = 0
    cache.y = 0
    cache.ffcc00 = 0
    cache.navy = 0
    move=0,point=0    
  }
  function updateScore() {
    document.all.ffcc00.innerText = cache.ffcc00
    document.all.navy.innerText = cache.navy
    if ((cache.ffcc00+cache.navy)==((size-1)*(size-1))) {
      board.onclick = null
      document.all.message.innerText = "Fim de Jogo!"
    }
     
  }

  function fillPos(x,y) {
    document.all.board.insertAdjacentHTML("beforeEnd","<DIV class=" + (player ? "p1B" : "p2B") + " ID=\"point"+point+"\">" + (player ? "Z" : "M") + "</DIV>")
    var el = document.all["point"+point].style
    el.pixelTop = (y*scale)+5
    el.pixelLeft = (x*scale)+5
    el.pixelWidth = scale - 5
    el.pixelHeight = scale - 5
  }
  function checkBoard(x,y,dir, player) {
    var piece=0
    if ("vertical"==dir) {
      if ((x==size) || (x>1)) {
        var bPos = boardArray[x-1][y]
        var nextV = boardArray[x-1][y+1]
        if ((bPos["vertical"]) && (bPos["horizontal"]) && (nextV["horizontal"])) {
          point++
          piece++
          fillPos(x-1,y)
        }
      } 
      if ((x==1) || (x<size)) {
          var nextV = boardArray[x+1][y]
          var nextH = boardArray[x][y+1]
          if ((nextV["vertical"]) && (nextH["horizontal"]) && (boardArray[x][y]["horizontal"])) {
            point++
            piece++
            fillPos(x,y)
          }
      }   
    }    
    else {
      if ((y==size) || (y>1)) {
        var nextV = boardArray[x+1][y-1]
        var bPos = boardArray[x][y-1]
        if ((bPos["vertical"]) && (bPos["horizontal"]) && (nextV["vertical"])) {
          point++
          piece++
          fillPos(x,y-1)
        } 
      }
      if ((y==1) || (y<size)) {
        var nextV = boardArray[x+1][y]
        var nextH = boardArray[x][y+1]
        if ((nextV["vertical"]) && (nextH["horizontal"]) && (boardArray[x][y]["vertical"])) {
          point++
          piece++
          fillPos(x,y)
        }
      }
    } 
    if (piece>0) {
      if (player)
       cache.navy+=piece
      else
       cache.ffcc00+=piece
      document.all.message.innerText = "Ponto! Jogue novamente."
      updateScore()
      return player
    }
    else
      return !player
        
  }

  function doMouseMove() {
    if (event.srcElement.className!="dot") {
      var x = Math.floor(event.offsetX / scale) 
      var y = Math.floor(event.offsetY / scale) 
      var dirX = (event.offsetX % scale)
      var dirY = (event.offsetY % scale)
      if ((x<size+1) && (y<size+1) && (y>0) && (x>0)) {
        if (dirX>=dirY) {
          if (x<size) {
            line.style.pixelHeight = 5 
            line.style.pixelWidth = scale  - 5
            line.style.pixelTop = (y * scale) 
            line.style.pixelLeft = (x * scale) + 5
            cache.direction = "horizontal"
          }
        } else
        {
          if (y<size) { 
            line.style.pixelWidth = 5 
            line.style.pixelHeight = scale - 5
            line.style.pixelTop = (y * scale) + 5
            line.style.pixelLeft = x * scale
            cache.direction = "vertical"
          }
        }
        cache.x = x
        cache.y = y
      }
    }
    
  }

  function doClick() {

    if (cache.x==0) return
    if (boardArray[cache.x][cache.y][cache.direction])
      document.all.message.innerText="Este espaço está sendo usado! Escolha outro."
    else {
      document.all.board.insertAdjacentHTML("beforeEnd","<DIV class=" + (player ? "p1" : "p2") + " ID=move"+move+"></DIV>")
      var el = document.all["move"+move]
      el.style.top = line.style.top 
      el.style.left = line.style.left 
      el.style.width = line.style.width
      el.style.height = line.style.height
      boardArray[cache.x][cache.y][cache.direction]=true
      var nextPlayer = checkBoard(cache.x,cache.y,cache.direction, player)
      if (nextPlayer!=player) {
        player = nextPlayer
        if (player) {
          document.all.message.innerText = "Vez do Azul"
          line.style.border = "1px navy solid"
        }
        else {
          document.all.message.innerText = "Vez do Amarelo"
          line.style.border = "1px ffcc00 solid"
        }
      }
    }

 
    move++
  }

  function buildDiv(x,y, scale) {
    return ("<DIV CLASS=dot STYLE=\"top:" +  (x*scale) + "; left: " + (y*scale) + "\"></DIV>")
  }   

  var boardArray = new Object


  function buildBoard() {
    initCache()
    board = ("<DIV ID=line STYLE=\"border: 1px navy solid; width: 0; height: 0\"></DIV>")
    boardArray = new Object()
    for (var x=1; x < size+1; x++) {
      boardArray[x] = new Object()
      for (var y=1; y < size+1; y++) {
        boardArray[x][y] = new Object
        boardArray[x][y]["vertical"] = false
        boardArray[x][y]["horizontal"] = false
        board+=(buildDiv(x,y, scale))
      }
    }

    return board
  }

  function createGame() {
    size=parseInt(document.all.setSize.value)
    if (size>12)
      size=12
    if (size<3)
      size=3
    document.all.setSize.value = size
    document.all.board.innerHTML = buildBoard()
    document.all.board.onclick = doClick
    totalSize = ((size+1)*scale) + 6
    document.all.board.style.pixelWidth = totalSize
    document.all.board.style.pixelHeight = totalSize
    document.all.message.innerText = "Azul joga primeiro. Boa sorte!"
    updateScore()    
  }
  document.write("<DIV ID=board STYLE=\"position: relative; height: "+ totalSize + "; width:" + totalSize + "; border: 1px black solid\">" + buildBoard() + "</DIV>")
  document.all.board.onmousemove = doMouseMove
  document.all.board.onclick = doClick

</script>
      </p>
      <table width="101" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="#808080"
    bordercolordark="#FFFFFF" bgcolor="#cacaca">
        <tr> 
          <td style="color: ffcc00" bgcolor="#FFFFCC"><font size="2" face="Arial, Verdana"
        color="#F5C503"><b>aMarelo</b></font> </td>
          <td ID="ffcc00" bgcolor="#000000"><font size="3" face="Arial, Verdana">0</font> 
          </td>
        </tr>
        <tr> 
          <td style="color: navy" bgcolor="#0080FF"><font face="Arial, Verdana" size="2"><b>aZul</b></font> 
          </td>
          <td ID="navy" bgcolor="#000000"><font size="3" face="Arial, Verdana">0</font> 
          </td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <table width="200" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#000000">
        <tr bgcolor="#FFFFFF"> 
          <td bgcolor="#000000"> <p align="left"><font face="Arial, Verdana" size="2">Tamanho 
              do tabuleiro: </font></td>
          <td bgcolor="#000000"> <form>
              <p> 
                <input TYPE="Text" VALUE="5" ID="setSize" SIZE="2">
              </p>
            </form></td>
        </tr>
        <tr bgcolor="#000000"> 
          <td COLSPAN="2" align="center"> <form>
              <p> 
                <input TYPE="button" ONCLICK="createGame()" VALUE="Novo jogo">
              </p>
            </form></td>
        </tr>
      </table></td>
    </tr>
</table>
</body>
</html>
<noframes>
<html></html>