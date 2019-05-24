<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="eSports_Informer.WebForm1" MasterPageFile="MasterPage.Master" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head">
    <script type="text/javascript" src="../Scripts/Registration.js"></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <form onsubmit="return checkAll()" method="post" runat="server">
        Nickname: <input type="text" name="nickname" id="nickname" onfocus="clearErr('nicknameErr')" onkeypress="checkUsername()" />
        <div id="nicknameErr"></div><br />
        Password: <input type="password" name="password" id="password" onfocus="clearErr('passwordErr')" onkeypress="checkPassword()" /><br />
        <div id="passwordErr"></div><br />
        Confirm Password: <input type="password" name="confirmPassword" id="confirmPassword" onfocus="clearErr('nicknameErr')" onkeypress="checkConfirmPassword()" />
        <div id="confirmPasswordErr"></div><br /><br />
        Gender: <input type="radio" name="gender" id="genderMale" value="male" />Male <input type="radio" name="gender" id="genderFemale" value="female" />Female
        <div id="genderErr"></div><br /><br />
        Email: <input type="email" placeholder="someone@example.com" name="email" id="email" onfocus="clearErr('emailErr')" onkeypress="checkEmail()" />
        <div id="emailErr"></div><br /><br />
        Region: <select name="region" id="region">
            <option disabled="disabled">Select your region</option>
            <option value="NA">North-America</option>
            <option value="SA">South-America</option>
            <option value="EU">Europe</option>
            <option value="Asia">Asia</option>
        </select>
        <div id="regionErr"></div><br /><br />
        Played Games: <input type="checkbox" value="SFIII" name="playedGames" id="SFIII" /> Street Fighter III 3rd Strike <input type="checkbox" value="SFV" name="playedGames" id="SFV" /> Street Fighter V <input type="checkbox" value="T7" name="playedGames" id="T7" /> Tekken 7 <input type="checkbox" value="SSBM" name="playedGames" id="SSBM" /> Super Smash Bros. Melee <input type="checkbox" value="SSBU" name="playedGames" id="SSBU" /> Super Smash Bros. Ultimate
        <div id="playedGamesErr"></div><br /><br />
        <div class="g-recaptcha" data-sitekey="6LeZ3IoUAAAAALPzD2Eo51EnHKxTVRQOsNY4Me2m"></div>
        <div id="captchaErr"></div><br />
        <input type="reset" />
        <input type="submit" value="Submit" name="submit" />
    </form>

    <%
        Response.Write(Session["exists"]);
        if (Request.Form["submit"] != null)
        {
            string username = Request.Form["nickname"];
            string password = Request.Form["password"];
            string email = Request.Form["email"];
            string region = Request.Form["region"];
            string games = Request.Form["playedGames"];
            int gender = Request.Form["gender"] == "male" ? 0 : 1;
            if (ADOHelper.Exist(username))
            {
                Session["exists"] = $"User {username} already exists. Please choose a different username.";
                Response.Redirect("Register.aspx");
            }
            else
            {
                ADOHelper.Insert(username, password, email, gender, region, games);
                Session["error"] = ADOHelper.error;
                Session["exists"] = string.Empty;
                Response.Redirect("Login.aspx");
            }
        }
    %>
</asp:Content>
