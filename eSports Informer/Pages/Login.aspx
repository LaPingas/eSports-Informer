﻿<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eSports_Informer.WebForm3" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <form method="post" onsubmit="return true">
        Nickname: <input type="text" name="nickname" id="nickname" maxlength="15" /><br />
        Password: <input type="password" name="password" id="password" /><br />
        <a href="ForgotPassword.aspx" class="button">Reset password</a>
        <a href="Register.aspx" class="button">Not registered yet</a>
        <input type="submit" value="Submit" name="submit">

        <%
            Response.Write(Session["logged"]);
            if (Request.Form["submit"] != null)
            {
                if (ADOHelper.Authentication(Request.Form["nickname"], Request.Form["password"]))
                {
                    Session["username"] = Request.Form["nickname"];
                    Session["logged"] = string.Empty;
                    Session["user"] = ADOHelper.ReadUserData(Session["username"].ToString());
                    Response.Redirect("Index.aspx");
                }
                else
                {
                    Session["logged"] = $"Incorrect username/password. Try again";
                    Response.Redirect("Login.aspx");
                }
            }
        %>
    </form>
</asp:Content>