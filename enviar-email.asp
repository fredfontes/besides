<html>
<%

sYouEmail="contato@besideswd.com.br"

Function ValidateField(sFieldvalue, sFieldtype)
	ValidField = true
	Select Case LCase(sFieldtype)
		Case "name"
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
<center><form action="<%= Request.ServerVariables("Script_Name") %>" method="post">
<table border="0" cellspacing="0" width="240" cellpadding=0>
<tr>
      <td ALIGN="left">Assunto:</td>
    </tr>
<tr><td><input name="subject" type="text" value="<%= Request.Form("subject") %>" SIZE="45"></INPUT></td>
</tr><tr><td><%
		If dictFields(LCase("subject")) Then
		Response.Write "Você precisa preencher os campos de email"
	Else		
		Response.Write "&nbsp;"
		End If
		%>
</td></tr>
<tr>
<td ALIGN="left">Seu nome:</td></tr>
<tr><td><input name="name" type="text" value="<%= Request.Form("name") %>" SIZE="45"></INPUT></td>
</tr><tr><td><%
		If dictFields(LCase("name")) Then
		Response.Write "Você precisa preencher os campos de email"
	Else		
		Response.Write "&nbsp;"
		End If
		%>
</td></tr>
	<tr>
		<td ALIGN="left">Seu email:</td></tr>
		<tr><td><input name="email" type="text" value="<%= Request.Form("email") %>" SIZE="45"></INPUT></td>
		</tr><tr><td><%
		If dictFields(LCase("email")) Then
		Response.Write "Você precisa colocar seu email"
	Else		
		Response.Write "&nbsp;"
		End If
		%>
</td></tr>
	<tr>
		<td ALIGN="left">Mensagem:</td></tr>
		<tr><td><TEXTAREA NAME="message" WRAP=VIRTUAL COLS="45" ROWS=7><%= Request.Form("message") %></TEXTAREA></td>
		</tr><tr><td><%
		If dictFields(LCase("message")) Then
		Response.Write "Você precisa escrever alguma mensagem."
	Else		
		Response.Write "&nbsp;"
		End If
%>
</td></tr>
</table><p><input type="submit" value="Enviar"></input><br></form>
<P>
<%
End Sub
Sub Send
sPunter = Request.Form("Name")
EmailSubject= Request.Form("subject")
sPunterEmail = Request.Form("Email")
Message = Request.Form("message")

sMessage = "Msg vinda de:" & sPunter & vbcrlf _
        & vbcrlf _
		& vbcrlf _
		& Message & vbcrlf _
		& vbcrlf _
		& "Email:" & sPunterEmail & vbcrlf _
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
<B>Sua memsagem foi enviada!</B><BR>
<%
Call Send
Else
ShowForm
End If
%>
</html>