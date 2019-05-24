<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="UsersTable.aspx.cs" Inherits="eSports_Informer.UsersTable" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <%
        Response.Write(ADOHelper.UsersTable());
    %>
</asp:Content>