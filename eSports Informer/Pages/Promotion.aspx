<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="Promotion.aspx.cs" Inherits="eSports_Informer.Promotion" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <form runat="server">
        Who's the GOAT? <input type="text" name="answer" />
        <input type="submit" name="submit" />
    </form>

    <%
        if (Request.Form["submit"] != null)
        {
            string answer = Request.Form["answer"];
            User user = (User)Session["user"];
            if (answer == "Mang0")
            {
                ADOHelper.Promotion(user);
                Response.Write("Promoted!");
                Session["user"] = ADOHelper.ReadUserData(Session["username"].ToString());
            }
            else
            {
                Response.Write("Wrong answer.");
            }
        }
    %>
</asp:Content>