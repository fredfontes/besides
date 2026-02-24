<?php

       if (($sender_email == "") || ($sender_name == "") || ($message == "")) {
                header("Location: index.html");
                exit;
       }


       $recipient = "contato@besideswd.com.br"; //email recipiente
       $subject = "assunto";      //assunto da mensagem

       $mailheaders = "From: <$sender_email> \n";
       $mailheaders .= "Reply-To: <$sender_email>\n\n";

       $msg = "De:   $sender_name\n";
       $msg .= "Email: $sender_email\n";
       $msg .= "Messagem:         $message\n\n";

       mail($recipient, $subject, $msg, $mailheaders) or die ("Impossivel enviar email!");

?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
        <TITLE>contato via hp</TITLE>
<meta http-equiv="Refresh" content="3;URL=index.html">
</HEAD>

<BODY BGCOLOR="#000000" TEXT="#FFFFFF">
<div align=center>

<p class=h2>Email enviado!</p>

<P>Obrigado, <?php echo "$sender_name"; ?> (<?php echo "$sender_email"; ?>), por ter enviado esta mensagem:</p>
<P><?php echo "$message"; ?></p>

</div>

</body>
</html>
