<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="eSports_Informer.Logout" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <%
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Index.aspx");
    %>
</asp:Content>