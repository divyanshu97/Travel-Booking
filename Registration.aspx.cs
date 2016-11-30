using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;

public partial class Registration : System.Web.UI.Page
{
    //Redirecting with session
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(Convert.ToInt32(Session["Login"])==1)
        //{
        //    Response.Redirect("../"+Session["LastPage"].ToString());
        //}
    }

    protected void SendActivationEmail()
    {
        using (MailMessage mm = new MailMessage("anchal.chaudhary329@gmail.com", tbxEmail.Text))
        {
            mm.Subject = "Account Activation";
            string body = "Hello " + tbxName.Text.Trim() + ", your account has been activated. Your login id is " + tbxEmail.Text + " and password is " + tbxPassword.Text;
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("anchal.chaudhary329@gmail.com", "Google.Anchal");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }
    }
    private string Encrypt(string enteredPassword)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(enteredPassword);
        try
        {
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    enteredPassword = Convert.ToBase64String(ms.ToArray());
                }
            }

        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex.ToString());
        }
        return enteredPassword;
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
        string dob = tbxDOB.Text;
        int result = string.Compare(currentDate, dob);
        if (result < 0 || result == 0)
        {
            tbxDOB.Text = String.Empty;
            lblInfo.Text = "Invalid Date of Birth";
        }
        else
        {
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            string checkEmail = "select count(*) from tblRegistration where Email='" + tbxEmail.Text + "'";
            SqlCommand cmdEmail = new SqlCommand(checkEmail, connect);
            connect.Open();
            int temp = Convert.ToInt32(cmdEmail.ExecuteScalar().ToString());
            connect.Close();
            if (temp == 0)
            {
                try
                {
                    string getFields = "insert into tblRegistration(Name,Email,PW,SecurityQuestion,Answer,Category_Id,Phone,DOB,City) values(@name, @email, @pw, @question, @answer, @category, @phone, @dob, @city)";
                    SqlCommand cmd = new SqlCommand(getFields, connect);
                    string encryptPassword = Encrypt(tbxPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@name", tbxName.Text);
                    cmd.Parameters.AddWithValue("@email", tbxEmail.Text);
                    cmd.Parameters.AddWithValue("@pw", encryptPassword);
                    cmd.Parameters.AddWithValue("@question", dropQues.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@answer", tbxAns.Text);
                    cmd.Parameters.AddWithValue("@category", dropRoles.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@phone", tbxPhone.Text);
                    cmd.Parameters.AddWithValue("@dob", tbxDOB.Text);
                    cmd.Parameters.AddWithValue("@city", tbxCity.Text);
                    connect.Open();
                    cmd.ExecuteNonQuery();
                    connect.Close();
                    Session["LoginEmail"] = tbxEmail.Text;
                    //string message;
                    if (string.Compare(dropRoles.SelectedItem.ToString(), "Admin") == 0)
                    {
                        string regNo= "select RegID from tblRegistration where Email='" + tbxEmail.Text + "'";
                        SqlCommand regCmd = new SqlCommand(regNo, connect);
                        connect.Open();
                        string reg_Id = regCmd.ExecuteScalar().ToString(); //check this

                        connect.Close();
                        Session["UserId"] = reg_Id;
                        string adminReg = "insert into tblAdmin(RegID) values(@RegID)";
                        SqlCommand adminCmd = new SqlCommand(adminReg, connect);
                        adminCmd.Parameters.AddWithValue("@RegID", reg_Id);
                        connect.Open();
                        adminCmd.ExecuteNonQuery();
                        connect.Close();
                        
                        Response.Write("<script>alert('Registered. Email will be sent on approval')</script>");
                        Response.Redirect("AdminHome.aspx");

                        //redirecting to adminhome.aspx

                    }
                    if (string.Compare(dropRoles.SelectedItem.ToString(), "User")==0)
                    {
                        ////Session for reg id

                        string regNo = "select RegID from tblRegistration where Email='" + tbxEmail.Text + "'";
                        SqlCommand regCmd = new SqlCommand(regNo, connect);
                        connect.Open();

                        string reg_Id = regCmd.ExecuteScalar().ToString(); //check this
                        connect.Close();
                       
                        string userData = "insert into tblUsers(XP,Rating,RegId)values(@XP,@Rating,@RegId)";
                        SqlCommand cmduserData = new SqlCommand(userData, connect);
                        cmd.Parameters.AddWithValue("@XP", 10);
                        cmd.Parameters.AddWithValue("@Rating", 3);
                        cmd.Parameters.AddWithValue("@RegId",Convert.ToInt32(reg_Id));

                        connect.Open();
                        cmd.ExecuteNonQuery();
                        connect.Close();

                        Session["Login"] = 1;
                        string getUserId = "select RegID from tblRegistration where Email='" + tbxEmail.Text + "'";
                        SqlCommand cmduserId = new SqlCommand(getUserId, connect);
                        connect.Open();
                        int user_Id = Convert.ToInt32(cmduserId.ExecuteScalar().ToString());
                        Session["UserId"] = reg_Id;
                        
                        //redirecting to userhome.aspx
                        Response.Redirect("UserHomePage.aspx");

                    }
                    Session["Login"] = 1;
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.ToString());
                }
            }
            else
            {
                // Change
                lblInfo.Text = tbxEmail.Text+" Email already registered";
                tbxEmail.Text = "";
            }
        }
    }
}
