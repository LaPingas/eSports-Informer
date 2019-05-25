<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="UsersTable.aspx.cs" Inherits="eSports_Informer.UsersTable" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderId="head"></asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderId="body">
    <form runat="server">
        <%
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
                Response.Write("User(s) deleted. Refreshing");
                Response.Write(ADOHelper.error);
                System.Threading.Thread.Sleep(2000);
                Response.Redirect("UsersTable.aspx");
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
        }
    %>
</asp:Content>