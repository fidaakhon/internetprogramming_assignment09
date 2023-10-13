<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Drink List</title>
</head>
<body>

    <form>
        <label for="drinkList">Select a drink:</label>
        <select id="drinkList" name="drinkList">
            <%
                try {
                    // Establishing database connection
                    String url = "jdbc:mysql://localhost:3306/Database";
                    String user = "your_username";
                    String password = "your_password";
                    Connection connection = DriverManager.getConnection(url, user, password);

                    // Query to retrieve drinks and rates
                    String query = "SELECT drinkname, rate FROM beverages";
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery(query);

                    // Populate the dropdown list
                    while (resultSet.next()) {
                        String drinkname = resultSet.getString("drinkname");
                        int rate = resultSet.getInt("rate");
            %>
                        <option value="<%= rate %>"><%= drinkname %> - <%= rate %></option>
            <%
                    }

                    // Close resources
                    resultSet.close();
                    statement.close();
                    connection.close();

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </select>
    </form>

</body>
</html>
