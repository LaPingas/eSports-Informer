using System;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// The ADO helper
/// </summary>
public static class ADOHelper
{
    // The SQL connection
    private static SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='|DataDirectory|Database.mdf';Integrated Security=True");
    // The table name
    private const string TABLE_NAME = "UserTable";
    // Errors
    public static string error;

    /// <summary>
    /// Executes an insert/udpate command
    /// </summary>
    /// <param name="cmd"> The command to execute </param>
    public static void Execute(string sql)
    {
        // The SQL command object
        SqlCommand cmd = new SqlCommand(sql, connection);
        try
        {
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        catch (Exception e)
        {
            error = e.Message;
            connection.Close();
        }
    }
    /// <summary>
    /// Executes a select command
    /// </summary>
    /// <param name="cmd"> The command to execute </param>
    /// <param name="x"> An indicator </param>
    public static bool Execute(string sql, int x)
    {
        // The SQL command object
        SqlCommand cmd = new SqlCommand(sql, connection);
        // Check object
        Object obj = null;
        try
        {
            connection.Open();
            obj = cmd.ExecuteScalar();
            connection.Close();
            return obj != null;
        }
        catch (Exception e)
        {
            error = e.Message;
            connection.Close();
            return false;
        }
    }

    /// <summary>
    /// Checks if a given username exists
    /// </summary>
    /// <param name="username"> The given username </param>
    /// <returns> True if the username exist, otherwise false </returns>
    public static bool Exist(string username)
    {
        // The SQL command
        string sql = $"SELECT * FROM {TABLE_NAME} WHERE username = '{username}'";
        return Execute(sql, 0);
    }

    /// <summary>
    /// Reads user data
    /// </summary>
    /// <param name="username"> The given username </param>
    public static User ReadUserData(string username)
    {
        // The SQL command
        string sql = $"SELECT * FROM {TABLE_NAME} WHERE username = '{username}'";
        connection.Open();
        SqlCommand command = new SqlCommand(sql, connection);
        SqlDataReader data = command.ExecuteReader();
        if (data.Read())
        {
            string password = data["password"].ToString();
            string email = data["email"].ToString();
            int gender = Convert.ToInt32(data["gender"]);
            string region = data["region"].ToString();
            string games = data["games"].ToString();
            string isAdmin = Convert.ToInt32(data["isAdmin"]) == 1 ? "Yes" : "No";
            User user = new User(username, password, email, gender, region, games, isAdmin);
            connection.Close();
            return user;
        }
        else
        {
            connection.Close();
            return null;
        }
    }

    /// <summary>
    /// Find users with specific values
    /// </summary>
    /// <returns> Users with specific values </returns>
    public static string FindUsers(string password = "", string email = "", int gender = -1)
    {
        connection.Open();
        string foundUsers;
        if (password != "")
        {
            // The SQL command
            string select = $"SELECT * FROM {TABLE_NAME} WHERE password = '{password}'";
            SqlCommand command = new SqlCommand(select, connection);
            SqlDataReader data = command.ExecuteReader();
            if (data.Read())
            {
                foundUsers = data.GetString(0) + ", ";
                while (data.Read())
                {
                    foundUsers += data.GetString(0) + ", ";
                }
                if (foundUsers.Length > 0)
                {
                    foundUsers = foundUsers.Remove(foundUsers.Length - 2, 2);
                }
                connection.Close();
                return foundUsers;
            }
            else
            {
                connection.Close();
                return null;
            }
        }
        if (email != "")
        {
            // The SQL command
            string select = $"SELECT * FROM {TABLE_NAME} WHERE email = '{email}'";
            SqlCommand command = new SqlCommand(select, connection);
            SqlDataReader data = command.ExecuteReader();
            if (data.Read())
            {
                foundUsers = data.GetString(0) + ", ";
                while (data.Read())
                {
                    foundUsers += data.GetString(0) + ", ";
                }
                if (foundUsers.Length > 0)
                {
                    foundUsers = foundUsers.Remove(foundUsers.Length - 2, 2);
                }
                connection.Close();
                return foundUsers;
            }
            else
            {
                connection.Close();
                return null;
            }
        }
        if (gender != -1)
        {
            // The SQL command
            string select = $"SELECT * FROM {TABLE_NAME} WHERE gender = '{gender}'";
            SqlCommand command = new SqlCommand(select, connection);
            SqlDataReader data = command.ExecuteReader();
            if (data.Read())
            {
                foundUsers = data.GetString(0) + ", ";
                while (data.Read())
                {
                    foundUsers += data.GetString(0) + ", ";
                }
                if (foundUsers.Length > 0)
                {
                    foundUsers = foundUsers.Remove(foundUsers.Length - 2, 2);
                }
                connection.Close();
                return foundUsers;
            }
            else
            {
                connection.Close();
                return null;
            }
        }
        return null;
    }

    /// <summary>
    /// Makes a dataset reference for the SQL command result
    /// </summary>
    /// <param name="sql"> SQL Query </param>
    /// <returns> Dataset reference for the SQL command result </returns>
    public static DataSet GetDataSet(string sql)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter adapter;

        SqlCommand cmd = new SqlCommand(sql, connection);
        adapter = new SqlDataAdapter(cmd);
        try
        {
            connection.Open();
            adapter.Fill(ds);
            connection.Close();
        }
        catch
        {
            return null;
        }
        return ds;
    }

    /// <summary>
    /// Generates users table data
    /// </summary>
    /// <returns> Users table </returns>
    public static string UsersTable()
    {
        string sql = $"SELECT * FROM {TABLE_NAME}";
        DataSet ds = GetDataSet(sql);

        string resultStr = "";
        DataRow row;

        // Table logo and title      
        resultStr += "<h1 style=\"text-align:center\"> Table Of Users </h1>";

        // Setting table header
        resultStr += "<table border='1' align='center' >";
        resultStr += "<tr><th>Username</th><th>Password</th><th>Email</th><th>Gender</th><th>Region</th><th>Games</th><th>Admin</th><th>Delete?</th><th>Promote</th></tr>";

        // Scanning all rows of the 1st table in the DataSet (Tables[0])
        for (int k = 0; k < ds.Tables[0].Rows.Count; k++)
        {
            row = ds.Tables[0].Rows[k];
            resultStr += "<tr>";
            resultStr += "<td name=\"username\">" + row["username"] + "</td>";
            resultStr += "<td>" + row["password"] + "</td>";
            resultStr += "<td>" + row["email"] + "</td>";
            if ((bool)row["gender"])
                resultStr += "<td>Female</td>";
            else
                resultStr += "<td>Male</td>";
            resultStr += "<td>" + row["region"] + "</td>";
            resultStr += "<td>" + row["games"].ToString().Replace(",", ", ") + "</td>";
            resultStr += "<td>" + row["isAdmin"] + "</td>";
            resultStr += "<td>" + $"<input type=\"checkbox\" name=\"delete\" value=\"{row["username"]}\" />" + "</td>";
            string value = ReadUserData(row["username"].ToString()).IsAdmin == "Yes" ? "checked" : "";
            resultStr += "<td>" + $"<input type=\"checkbox\" name=\"promote\" value=\"{row["username"]}\" {value} />" + "</td>";
            resultStr += "</tr>";
        }
        resultStr += "</table>";

        return resultStr;
    }

    /// <summary>
    /// Checks if a given username and password combination exist
    /// </summary>
    /// <param name="username"> The given username </param>
    /// <param name="password"> The given username's password </param>
    /// <returns> True if the combination exists, otherwise false </returns>
    public static bool Authentication(string username, string password)
    {
        // The SQL command
        string sqlAuth = $"SELECT * FROM {TABLE_NAME} WHERE (username = '{username}') AND (password = '{password}')";
        return Execute(sqlAuth, 0);
    }

    /// <summary>
    /// Inserts the given user's data to the database
    /// </summary>
    /// <param name="username"> The given username </param>
    /// <param name="password"> The given user's password </param>
    /// <param name="email"> The given user's email </param>
    /// <param name="birthday"> The given user's birthday </param>
    /// <param name="gender"> The given user's gender </param>
    public static void Insert(string username, string password, string email, int gender, string region, string games)
    {
        // The SQL command
        string insert = $"INSERT INTO {TABLE_NAME} (username, password, email, gender, region, games, isAdmin) VALUES ('{username}', '{password}', '{email}', {gender}, '{region}', '{games}', 0)";
        Execute(insert);
    }

    /// <summary>
    /// Updates user's information
    /// </summary>
    /// <param name="username"> The given username </param>
    /// <param name="password"> Optional parameter, the given user's password </param>
    /// <param name="email"> Optional parameter, the given user's email </param>
    /// <param name="birthday"> Optional parameter, the given user's birthday </param>
    /// <param name="gender"> Optional parameter, the given user's gender </param>
    public static void Update(this User user, string password = "", string email = "", int gender = -1, string region = "")
    {
        if (password != "")
        {
            // The SQL command
            string update = $"UPDATE {TABLE_NAME} SET password = '{password}' WHERE username = '{user.Username}'";
            Execute(update);
        }
        if (email != "")
        {
            // The SQL command
            string update = $"UPDATE {TABLE_NAME} SET email = '{email}' WHERE Username = '{user.Username}'";
            Execute(update);
        }
        if (region != "")
        {
            // The SQL command
            string update = $"UPDATE {TABLE_NAME} SET region = '{region}' WHERE Username = '{user.Username}'";
            Execute(update);
        }
        if (gender != -1)
        {
            // The SQL command
            string update = $"UPDATE {TABLE_NAME} SET Gender = {gender} WHERE Username = '{user.Username}'";
            Execute(update);
        }
    }

    /// <summary>
    /// Promote a user to an admin
    /// </summary>
    /// <param name="user"> The given user </param>
    public static void Promotion(this User user)
    {
        string update = $"UPDATE {TABLE_NAME} SET isAdmin = 1 WHERE username = '{user.Username}'";
        Execute(update);
    }

    /// <summary>
    /// Unpromote a user
    /// </summary>
    /// <param name="user"> The given user </param>
    public static void Unpromotion(this User user)
    {
        string update = $"UPDATE {TABLE_NAME} SET isAdmin = 0 WHERE username = '{user.Username}'";
        Execute(update);
    }

    /// <summary>
    /// Deletes the user from the database
    /// </summary>
    /// <param name="username"> The given username </param>
    public static void Delete(string username)
    {
        string delete = $"DELETE FROM {TABLE_NAME} WHERE username = '{username}'";
        Execute(delete);
    }
}

public class User
{
    private string username, password, email, region, games, isAdmin;
    private int gender;

    public User(string username, string password, string email, int gender, string region, string games, string isAdmin)
    {
        this.username = username;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.region = region;
        this.games = games;
        this.isAdmin = isAdmin;
    }
    public string Username
    {
        get { return username; }
        set { username = value; }
    }
    public string Password
    {
        get { return password; }
        set { password = value; }
    }
    public string Email
    {
        get { return email; }
        set { email = value; }
    }
    public int Gender
    {
        get { return gender; }
        set { gender = value; }
    }
    public string Region
    {
        get { return region; }
        set { region = value; }
    }
    public string Games
    {
        get { return games; }
        set { games = value; }
    }
    public string IsAdmin
    {
        get { return isAdmin; }
        set { isAdmin = value; }
    }
}