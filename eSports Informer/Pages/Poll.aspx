<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="Poll.aspx.cs" Inherits="eSports_Informer.Poll" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <form runat="server">
        What is your favorivte eSports genre?
        <select name="selection">
            <option disabled="disabled">Select your answer</option>
            <option value="0">FPS</option>
            <option value="1">Fighting games</option>
            <option value="2">Card Games</option>
            <option value="3">MOBA</option>
            <option value="4">Other</option>
        </select>
        <input type="submit" name="submit" />
    </form>

    <%
        if (Request.Form["submit"] != null)
        {
            int value = int.Parse(Request.Form["selection"]);
            Response.Write($"Your selection was {value + 1} <br />");

            int[] pollResults = (int[])Application["pollResults"];
            pollResults[value]++;
            Application["pollResults"] = pollResults;

            Response.Write($"FPS: {pollResults[0]}, FGs: {pollResults[1]}, Card Games: {pollResults[2]}, MOBA: {pollResults[3]}, other: {pollResults[4]}");
        }
    %>
</asp:Content>