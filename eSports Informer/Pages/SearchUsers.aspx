<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="SearchUsers.aspx.cs" Inherits="eSports_Informer.Pages.SearchUsers" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
        <form runat="server">
        Password: <input type="password" name="password" id="password" /><br /><br />
        Gender: <input type="radio" name="gender" id="genderMale" value="male" />Male <input type="radio" name="gender" id="genderFemale" value="female" />Female<br />
        Email: <input type="text" placeholder="someone@example.com" name="email" id="email" /><br />
        <input type="submit" name="submitSearch" />
    </form>

    <%
        string username = "";
        if (Request.Form["submitSearch"] != null)
        {
            username = ADOHelper.FindUsers(Request.Form["password"], Request.Form["email"], Request.Form["gender"] == "male" ? 0 : Request.Form["gender"] == "female" ? 1 : -1);
            Response.Write(username + "<br />");
        }
    %>
</asp:Content>