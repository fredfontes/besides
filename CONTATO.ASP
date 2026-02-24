<html>
<link href="ESTILO.CSS" rel="stylesheet" type="text/css">

<%

' Your Email Address - must be a valid domain or the mail will not send
sYouEmail="contato@besideswd.com.br"
' Email Subject

Function ValidateField(sFieldvalue, sFieldtype)
	ValidField = true
	Select Case LCase(sFieldtype)
		Case "name"
		If Len(sFieldvalue) = 0 Then ValidField = False
		Case "tell"
		If Len(sFieldvalue) = 0 Then ValidField = False
		Case "email"
			If Len(sFieldvalue) < 5 Then
				ValidField = False
			Else
				If InStr(1, sFieldvalue, "@", 1) < 2 Then
					ValidField = False
				Else
					If InStr(1, sFieldvalue, ".", 1) < 4 Then
						ValidField = False
					End If
				End If
			End If
		Case "message"
			If Len(sFieldvalue) = 0 Then ValidField = False
		Case "else"
			ValidField = False
	End Select
ValidateField = ValidField
End Function
Sub ShowForm
%>
<title>&lt; BeSides Web Design &gt;</title><body bgcolor="#000000" text="#FFFFFF">
<font face="verdana" size="1" color="ffffff">
<form action="<%= Request.ServerVariables("Script_Name") %>" method="post">
<table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr> 
        <td height="19" ALIGN="left"><strong>Assunto:</strong></td>
        <td width="100" rowspan="13" align="center" valign="middle"><a href="http://www.besideswd.com.br"><img src="alien.gif" width="159" height="169" border="0"></a></td>
      </tr>
      <tr> 
        <td height="21"><input name="EmailSubject" type="text" value="<%= Request.Form("EmailSubject") %>" size="45">
           
        </td>
      </tr>
      <tr> 
        <td height="18"> 
          <%
		If dictFields(LCase("subject")) Then
		Response.Write "<font face=""verdana"" size=""2"" color=""darkblue"">Você precisa preencher os campos do email</font>"
	Else		
		Response.Write "&nbsp;"
		End If
		%>
        </td>
      </tr>
<tr>
        <td ALIGN="left"><b>Seu nome:</b></td>
    </tr>
<tr><td><input name="name" type="text" value="<%= Request.Form("name") %>" SIZE="45"></td>
</tr><tr><td><%
		If dictFields(LCase("name")) Then
		Response.Write "<font face=""verdana"" size=""2"" color=""darkblue"">Você precisa preencher seu nome</font>"
	Else		
		Response.Write "&nbsp;"
		End If
		%>
</td></tr>
<tr><td ALIGN="left"><b>Telefone de contato:</b></td>
    </tr>
<tr><td><input name="name" type="text" value="<%= Request.Form("tell") %>" SIZE="45"></td>
</tr><tr><td><%
		If dictFields(LCase("name")) Then
		Response.Write "<font face=""verdana"" size=""2"" color=""darkblue"">Você precisa preencher seu nome</font>"
	Else		
		Response.Write "&nbsp;"
		End If
		%>
</td></tr>
	<tr>
		
        <td ALIGN="left"><b>Seu email:</b></td>
    </tr>
		<tr><td><input name="email" type="text" value="<%= Request.Form("email") %>" SIZE="45"></td>
		</tr><tr><td><%
		If dictFields(LCase("email")) Then
		Response.Write "<font face=""verdana"" size=""2"" color=""darkblue"">Você precisa preencher corretamente o seu email</font>"
	Else		
		Response.Write "&nbsp;"
		End If
		%>
</td></tr>
	<tr>
	<td ALIGN="left"><b>Como descobriu a BeSidesWD:</b></td>
    </tr>
<tr><td><input name="indicadopor" type="text" value="<%= Request.Form("indicadopor") %>" SIZE="45"></td>
</tr><tr><td><%
		If dictFields(LCase("indicadopor")) Then
		Response.Write "<font face=""verdana"" size=""2"" color=""darkblue"">Você precisa preencher todos os campos do email</font>"
	Else		
		Response.Write "&nbsp;"
		End If
		%>
</td>
	</tr>
	<tr>
		
        <td ALIGN="left"><b>Sua mensagem :</b></td>
    </tr>
		<tr><td><textarea NAME="message" WRAP="VIRTUAL" COLS="45" ROWS="7"><%= Request.Form("message") %></textarea></td>
		</tr><tr><td><%
		If dictFields(LCase("message")) Then
		Response.Write "<font face=""verdana"" size=""2"" color=""darkblue"">Você precisa preencher com alguma mensagem</font>"
	Else		
		Response.Write "&nbsp;"
		End If
%>
</td></tr>
<tr>
      <td colspan="2">&nbsp;</td>
    </tr>
</table>
  <div align="center"></div>
  <div align="center"></div>
  <p align="center">
    <input type="submit" value="Enviar email">
    <br>
</form>
<p align="center"> 
  <%
End Sub
Sub Send
EmailSubject = request.form("EmailSubject")
sPunter = Request.Form("Name")
Tell = request.form("Tell")
sPunterEmail = Request.Form("Email")
Message = Request.Form("message")
IndicadoPor = request.form("indicadopor")
sMessage = "Email vindo de (" & sPunter & " - " & sPunterEmail & ")" & vbcrlf _
        & "Como que " & sPunter & " descobriu a BesidesWD: " & indicadopor & vbcrlf _
		& vbcrlf _
		& "Assunto: " & EmailSubject & vbcrlf _
		& vbcrlf _
		& Message & vbcrlf _
		& vbcrlf _
		& "< BeSides Web Design Team >" & vbcrlf _
		& vbcrlf _
		& vbcrlf _
		& Mailout & vbcrlf _
		& vbcrlf		
Set objNewMail = CreateObject("CDONTS.NewMail")
objNewMail.Send sPunterEmail, sYouEmail, EmailSubject, sMessage
Set objNewMail = Nothing
End Sub

Set dictFields = Server.CreateObject("Scripting.Dictionary")
For Each Field in Request.Form
If ValidateField(Request.Form(Field), Field) = False Then
dictFields.Add LCase(Field), true
End If
Next
If Request.Form.Count <> 0 And dictFields.Count  = 0 Then
%>
  <center><font face="verdana" size="2" color="#000000"><br><br><a href="http://www.besideswd.com.br"><img src="alien.gif" border="0" WIDTH="159" HEIGHT="169"></a><br><br><b>Sua Mensagem foi enviada corretamente!</b></center>
  <%
Call Send
Else
ShowForm
End If
%>
  </font> </html>