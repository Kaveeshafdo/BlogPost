/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaServerlet;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class emailsender {

    public static boolean sendmail(String message, String to[], String sub) throws AddressException, MessagingException {

        final String from = "jamith@gladbull.com";
        final String pass = "123";

        String host = "localhost";
        Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "false");
        prop.put("mail.smtp.host", host);
        prop.put("mail.smtp.user", from);
        prop.put("mail.smtp.password", pass);
        prop.put("mail.smtp.port", 25);
        prop.put("mail.smtp.auth", "true");

        Session session = Session.getInstance(prop, null);
        MimeMessage mimeMessage = new MimeMessage(session);
        mimeMessage.setContent(message, "text/html");
        mimeMessage.setFrom(new InternetAddress(from));
        InternetAddress[] toadAddresses = new InternetAddress[to.length];
        for (int i = 0; i < to.length; i++) {
            toadAddresses[i] = new InternetAddress(to[i]);
        }
        for (int i = 0; i < toadAddresses.length; i++) {
            mimeMessage.addRecipient(RecipientType.TO, toadAddresses[i]);
        }
        mimeMessage.setSubject(sub);
        Transport transport = session.getTransport("smtp");
        transport.connect(host, from, pass);
        transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
        transport.close();
        return true;
    }

    public static boolean isValidEmailAddress(String email) {
        boolean result = true;
        try {
            InternetAddress emailAddr = new InternetAddress(email);
            emailAddr.validate();
        } catch (AddressException ex) {
            result = true;
        }
        return result;
    }
    
    public static void main(String[] args) {
        try {
            sendmail("hello there", new String[]{"kaveesha@gladbull.com"},"  sdfsdf ");
        } catch (MessagingException ex) {
            Logger.getLogger(emailsender.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
