<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="eSports_Informer.WebForm2" MasterPageFile="MasterPage.Master" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
<%
    int visits = (int)Application["visits"];
    visits++;
    Application["visits"] = visits;
%>
    <div style="text-align: center">
    <h1>Welcome to eSports Informer!</h1>
    <%
        if (Session["username"] != null)
        {
            Response.Write("<h2><a href=\"TierListBuilding.aspx\">Build a tierlist and help the community!</a></h2>");
        }
    %>
    </div>
    <%
        Response.Write($"Total visits: {Application["visits"]}");
    %>
    <h2>Upcoming tournaments</h2>
    <p>
        <b>2-4/11/2018: LATAM Regional Finals</b> - Brazil's Capcom Pro Tour premier (Street Fighter V)<br />
        <b>16-18/11/2018: Redbull Conquest Finals</b> - Redbull's fighting games circuit final stage. <a href="https://www.redbull.com/us-en/events/conquest" target="_blank">To the circuit's website</a> (Street Fighter V, Tekken 7, Guilty Gear Xrd REV2)<br />
        <b>14-16/12/2018: Capcom Cup 2018</b> - Capcom's "Capcom Pro Tour" for the year 2018 has almost come to an end - and this is the final stop. 32 of the Best Street Fighter V compete for the title. <a href="https://capcomprotour.com/capcom-cup-2018/" target="_blank">To the event's page</a> (Street Fighter V)<br />
        <b>1-3/2/2019: Genesis 6</b> - the first Super Smash Bros. major tournament of the year, including multiple Smash games and more. <a href="https://smash.gg/tournament/genesis-6" target="_blank">To the event's smash.gg page</a> (Super Smash Bros. 64, Super Smash Bros. Melee, Super Smash Bros. Ultimate, Rivals of Aether, Splatoon)<br />
    </p>
    <h2>eSports Insider RSS Feed</h2>
    <script src="//rss.bloople.net/?url=https%3A%2F%2Fesportsinsider.com%2Ffeed%2F&showtitle=false&showicon=true&type=js"></script>
    <div style="text-align: center">
    <div class="slideshow-container"></div>

    <div class="mySlides">
      <div>1 / 3</div>
      <img src="../Images/MLG_Anaheim_2014.jpg" style="width:30%" />
      <div>MLG Anaheim 2014</div>
    </div>

    <div class="mySlides">
      <div>2 / 3</div>
      <img src="../Images/evo_2017_finals-1.jpg" style="width:30%" />
      <div>EVO 2017</div>
    </div>

    <div class="mySlides">
      <div>3 / 3</div>
      <img src="../Images/lol_finals.jpg" style="width:30%" />
      <div>League of Legends Finals</div>
    </div> 
    <div style="text-align:center">
      <span class="dot"></span> 
      <span class="dot"></span> 
      <span class="dot"></span> 
    </div>
    </div>
    <script type="text/javascript" src="../Scripts/Slideshow.js"></script>
</asp:Content>