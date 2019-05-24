<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="eSports_Informer.UserInfo" %>
<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <div style="text-align:center">
        <%
            Response.Write(ADOHelper.error);
            User user = (User)Session["user"];
            string gender = user.Gender == 0 ? "Male" : "Female";
            Response.Write
                (
                $"Username: {Session["username"]} <br />" +
                $"Password: {user.Password} <br />" +
                $"Email: {user.Email} <br />" +
                $"Gender: {gender} <br />" +
                $"Region: {user.Region} <br />" +
                $"Games: {user.Games.Replace(",", ", ")} <br />" +
                $"Is Admin?: {user.IsAdmin}"
                );
        %>
    </div>
</asp:Content>