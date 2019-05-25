<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="UsersTable.aspx.cs" Inherits="eSports_Informer.UsersTable" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <form runat="server">
        <%
            if (Session["username"] == null || ((User)Session["user"]).IsAdmin != "Yes")
            {
                Response.Redirect("Index.aspx");
            }
            Response.Write(ADOHelper.UsersTable());
        %>
        <div style="text-align:center">
            <input type="submit" name="submit" />
        </div>
    </form>

    <%
        if (Request.Form["submit"] != null)
        {
            string deleteUsersString = Request.Form["delete"];
            if (deleteUsersString != null)
            {
                string[] deleteUsers = deleteUsersString.Split(',');
                foreach (var user in deleteUsers)
                {
                    if (user != "")
                    {
                        ADOHelper.Delete(user);
                    }
                }
            }

            string promoteUsersString = Request.Form["promote"];
            if (promoteUsersString != null)
            {
                string[] promoteUsers = promoteUsersString.Split(',');
                foreach (var user in promoteUsers)
                {
                    if (user != "")
                    {
                        ADOHelper.ReadUserData(user).Promotion();
                    }
                }
                Response.Write("User(s) promoted. Please refresh the page");
            }

            string unpromoteUsersString = Request.Form["unpromote"];
            if (unpromoteUsersString != null)
            {
                string[] unpromoteUsers = unpromoteUsersString.Split(',');
                foreach (var user in unpromoteUsers)
                {
                    if (user != "")
                    {
                        ADOHelper.ReadUserData(user).Unpromotion();
                    }
                }
                Response.Write("User(s) unpromoted. Please refresh the page");
            }

            Response.Redirect("UsersTable.aspx");
        }
    %>
</asp:Content>