<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SSBMTierList.aspx.cs" Inherits="eSports_Informer.SSBMTierList" MasterPageFile="MasterPage.Master" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head">
    <script type="text/javascript" src="../Scripts/TierListMaking.js"></script>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <center>
        <table>
            <tr>
                <th><img src="../Images/SSBM/120px-MeleeDr.Mario.jpg" id="drMario" ondrag="moveImage('drMario')" /></th>
                <th><img src="../Images/SSBM/120px-Ssbmmario.jpg" id="mario" ondrag="moveImage('mario')" /></th>
                <th><img src="../Images/SSBM/120px-Ssbmluigi.jpg" id="luigi" ondrag="moveImage('luigi')" /></th>
                <th><img src="../Images/SSBM/120px-Ssbmbowser.jpg" id="bowser" ondrag="moveImage('bowser')" /></th>
                <th><img src="../Images/SSBM/120px-Ssbmpeach.jpg" id="peach" ondrag="moveImage('peach')" /></th>
                <th><img src="../Images/SSBM/120px-Ssbmyoshi.jpg" id="yoshi" ondrag="moveImage('yoshi')" /></th>
                <th><img src="../Images/SSBM/120px-Ssbmdonkeykong.jpg" id="dk" ondrag="moveImage('dk')" /></th>
                <th><img src="../Images/SSBM/120px-Ssbmpicfalcon.gif" id="falcon" ondrag="moveImage('falcon')" /></th>
                <th><img src="../Images/SSBM/120px-GanondorfMelee.jpg" id="ganon" ondrag="moveImage('ganon')" /></th>
            </tr>
        </table>
        <table>
            <tr>
                <th><img src="../Images/SSBM/120px-Falco_Melee_art.jpg" id="falco" ondrag="moveImage('falco')" /></th>
                <th><img src="../Images/SSBM/120px-MeleeFox.jpg" id="fox" ondrag="moveImage('fox')" /></th>
                <th><img src="../Images/SSBM/120px-Ssbmness.jpg" id="ness" ondrag="moveImage('ness')" /></th>
                <th><img src="../Images/SSBM/120px-Ssbmiceclimbers.jpg" id="ics" ondrag="moveImage('ics')" /></th>
                <th><img src="../Images/SSBM/120px-Ssbmkirby.jpg" id="kirby" ondrag="moveImage('kirby')" /></th>
                <th><img src="../Images/SSBM/120px-MeleeSamus.jpg" id="samus" ondrag="moveImage('samus')" /></th>
                <th><img src="../Images/SSBM/120px-Zeldaart.jpg" id="zelda" ondrag="moveImage('zelda')" /></th>
                <th><img src="../Images/SSBM/120px-MeleeShiek.jpg" id="sheik" ondrag="moveImage('sheik')" /></th>
                <th><img src="../Images/SSBM/120px-MeleeLink.jpg" id="link" ondrag="moveImage('link')" /></th>
                <th><img src="../Images/SSBM/120px-Young_Link.jpg" id="ylink" ondrag="moveImage('ylink')" /></th>
            </tr>
        </table>
        <table>
            <tr>
                <td><img src="../Images/SSBM/120px-Pichuart.jpg" id="pichu" ondrag="moveImage('pichu')" /></td>
                <td><img src="../Images/SSBM/120px-MeleePikachu.jpg" id="pika" ondrag="moveImage('pika')" /></td>
                <td><img src="../Images/SSBM/120px-MeleeJigglypuff.jpg" id="jigs" ondrag="moveImage('jigs')" /></td>
                <td><img src="../Images/SSBM/120px-Mewtwo.jpg" id="mew2" ondrag="moveImage('mew2')" /></td>
                <td><img src="../Images/SSBM/120px-Mr.GameandWatchart.jpg" id="g&w" ondrag="moveImage('g&w')" /></td>
                <td><img src="../Images/SSBM/120px-MeleeMarth.jpg" id="marth" ondrag="moveImage('marth')" /></td>
                <td><img src="../Images/SSBM/120px-Roy1.jpg" id="roy" ondrag="moveImage('roy')" /></td>
            </tr>
        </table>
    </center>
</asp:Content>