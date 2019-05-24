<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="TierListBuilding.aspx.cs" Inherits="eSports_Informer.TierListBuilding" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <h1 style="text-align:center">Choose a game</h1>
    <div style="text-align:center">
        <a href="SFIIITierList.aspx"><img src="../Images/SFIII_Logo.jpg" alt="SFIII" /></a>
        <a href="SFVTierList.aspx"><img src="../Images/SFV_Logo.jpg" alt="SFV" /></a>
        <a href="T7TierList.aspx"><img src="../Images/T7_Logo.jpg" alt="T7" /></a>
        <a href="SSBMTierList.aspx"><img src="../Images/SSBM_Logo.jpg" alt="SSBM" /></a>
    </div>
</asp:Content>