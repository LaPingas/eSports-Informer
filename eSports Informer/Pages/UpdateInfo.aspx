<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateInfo.aspx.cs" Inherits="eSports_Informer.UpdateInfo" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <form onsubmit="return true" method="post" runat="server">
        Password: <input type="password" name="password" id="password" /><br />
        Gender: <input type="radio" name="gender" id="genderMale" value="male" />Male <input type="radio" name="gender" id="genderFemale" value="female" />Female <br />
        Email: <input type="text" placeholder="someone@example.com" name="email" id="email" /> <br />
        Region: <select name="region" id="region">
            <option disabled="disabled" selected="selected">Select your region</option>
            <option value="NA">North-America</option>
            <option value="SA">South-America</option>
            <option value="EU">Europe</option>
            <option value="Asia">Asia</option>
        </select> <br />
        <input type="reset" />
        <input type="submit" value="Submit" name="submit" />
    </form>

    <%
        Response.Write(Session["exists"]);
        if (Request.Form["submit"] != null)
        {
            string password = Request.Form["password"];
            string email = Request.Form["email"];
            string region = Request.Form["region"];
            int gender = Request.Form["gender"] == "male" ? 0 : Request.Form["gender"] == "male" ? 1 : -1;
            ADOHelper.Update((User)Session["user"], password, email, gender, region);
            Session["user"] = ADOHelper.ReadUserData(Session["username"].ToString());
            Response.Redirect("UserInfo.aspx");
        }
    %>
</asp:Content>