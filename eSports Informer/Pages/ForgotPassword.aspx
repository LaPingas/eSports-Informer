<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="eSports_Informer.ForgotPassword" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <form method="post" onsubmit="return true">
        Nickname: <input type="text" name="nickname" id="nickname" maxlength="15" /><br />
        Played Games: <input type="checkbox" value="SFIII" name="playedGames" id="SFIII" /> Street Fighter III 3rd Strike <input type="checkbox" value="SFV" name="playedGames" id="SFV" /> Street Fighter V <input type="checkbox" value="T7" name="playedGames" id="T7" /> Tekken 7 <input type="checkbox" value="SSBM" name="playedGames" id="SSBM" /> Super Smash Bros. Melee <input type="checkbox" value="SSBU" name="playedGames" id="SSBU" /> Super Smash Bros. Ultimate
        <div id="playedGamesErr"></div><br /><br />
        <input type="submit" value="Submit" name="submit">

        <%
            Response.Write(Session["incorrect"]);
            if (Request.Form["submit"] != null)
            {
                string username = Request.Form["nickname"];
                User user = ADOHelper.ReadUserData(username);
                Session["incorrent"] = string.Empty;

                if (Request.Form["playedGames"] == user.Games)
                {
                    Response.Write(user.Password);
                }
                else
                {
                    Session["incorrect"] = $"Incorrect username/played games. Try again";
                    Response.Redirect("ForgotPassword.aspx");
                }
            }
        %>
    </form>
</asp:Content>