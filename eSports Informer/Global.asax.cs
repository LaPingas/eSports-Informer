using System;

namespace eSports_Informer
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["visits"] = 0;
            Application["pollResults"] = new int[5];
            Application["online"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["failedAttempts"] = 0;
            int online = (int)Application["online"];
            online++;
            Application["online"] = online;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            int online = (int)Application["online"];
            online--;
            Application["online"] = online;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}