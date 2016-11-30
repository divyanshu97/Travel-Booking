using System;
using System.Net.Mail;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.IO;
using System.Text;
using System.Security.Cryptography;


public partial class Security : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private string Decrypt(string decryptedPassword)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] encriptBytes = Convert.FromBase64String(decryptedPassword);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(encriptBytes, 0, encriptBytes.Length);
                    cs.Close();
                }
                decryptedPassword = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return decryptedPassword;
    }


    protected void btnSendEmail_Click(object sender, EventArgs e)
    {

        try
        {
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            connect.Open();
            string getSecurityQuestion = "select SecurityQuestion from tblRegistration where Email='" + tbxEnterEmail.Text + "'";
            string getAnswer = "select Answer from tblRegistration where Email ='" + tbxEnterEmail.Text + "'";
            string getpass_word = "select PW from tblRegistration where Email ='" + tbxEnterEmail.Text + "'";
            string getname = "select Name from tblRegistration where Email ='" + tbxEnterEmail.Text + "'";
            SqlCommand cmdSecurityQuestion = new SqlCommand(getSecurityQuestion, connect);
            SqlCommand cmdAnswer = new SqlCommand(getAnswer, connect);
            SqlCommand cmdpass_word = new SqlCommand(getpass_word, connect);
            SqlCommand cmdname = new SqlCommand(getname, connect);
            int question = Convert.ToInt32(cmdSecurityQuestion.ExecuteScalar().ToString());
            string answer = cmdAnswer.ExecuteScalar().ToString();
            string pass_word = cmdpass_word.ExecuteScalar().ToString();
            string name = cmdname.ExecuteScalar().ToString();
            string SendingPassword = Decrypt(pass_word);
            //lblSecQues.Text = question;
            //lblAns.Text = answer;
            string stringQuestion;
            if (question == 1)
            {
                stringQuestion = "Favourite Color";
            }
            else if (question == 2)
            {
                stringQuestion = "Favourite Animal";
            }
            else if (question == 3)
            {
                stringQuestion = "Favourite Movie";
            }
            else 
            {
                stringQuestion = "Favourite Actor";
            }

            if (stringQuestion != ddlQues.SelectedItem.Text || answer != tbxEnterAnswer.Text)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Incorrect Question Answer Combination');", true);
            }
            else
            {
                //lblInfo.Text = "Sending Mail ";
                cmdSecurityQuestion.ExecuteNonQuery();
                cmdAnswer.ExecuteNonQuery();
                connect.Close();
                string activationCode = Guid.NewGuid().ToString();
                using (MailMessage mm = new MailMessage("divyanshushukla1997@gmail.com", tbxEnterEmail.Text))
                {
                    mm.Subject = "Forgot Password";
                    string body = "Hello " + name + ",  " + "Forgot Password " + "Your original Password was : " + SendingPassword + "";
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential("divyanshushukla1997@gmail.com", "28Mnids@97");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                    
                    SentMail(sender, e);
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Unable to send the message');", true);
        }
    }

    protected void SentMail(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }

    protected void dropQues_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}